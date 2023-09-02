
import React, { useState, useEffect } from 'react'
import axios from 'axios';
import Parser from 'html-react-parser';
import 'react-confirm-alert/src/react-confirm-alert.css'; // Import css
import { Link } from 'react-router-dom';
import config from '../../utils/config';
import { withRouter } from "react-router"
import { useSearchParams, useNavigate, useParams } from 'react-router-dom';

const OrderDetails = () => {

   // Function for edit //
   let { id } = useParams();

   const [orderDetails, setData] = useState({});
   const [ItemDetails, setOrderItems] = useState([]);
   const [display, setDisplay] = useState("block12");


   useEffect(() => {
      let url = `${config.api_url}/sells/all-sells/${id}`;
      if(window.sessionStorage.getItem("user_level_id") == "4") {
         url = `${config.api_url}/sells/all-vendor-sells/${id}/${window.sessionStorage.getItem("user_level_id")}`;
         setDisplay("none");
      }

      if (id) {
         // Get Order Details ///
         axios.get(`${config.api_url}/orders/details/${id}`)
            .then(res => {
               console.log(res.data);
               setData(res.data[0]);
            })
         // Get Order Item Details ///
         axios.get(url)
            .then(res => {
               console.log(res.data);
               setOrderItems(res.data);
            })
      }
   }, []);

   return (
      <section>
         <section id="content">
            <div className="container content">
               <div>
                  <div className="col-md-12">
                     <div>
                        <h4 className='myhead'>Details of Order ID : {orderDetails.order_id}  </h4>
                     </div>
                     <br />
                  </div>
               </div>
               <div>
                  <table className="table table-striped table-hover">
                     <thead className="thead-dark">
                        <tr>
                           <th className="nbg">Order ID</th>
                           <td className='bgwhite'> {orderDetails.order_id}</td>
                           <th>Order Date</th>
                           <td className='bgwhite'> {orderDetails.order_date}</td>
                        </tr>
                        <tr>
                           <th>User Name</th>
                           <td className='bgwhite'> {orderDetails.user_name}</td>
                           <th>Contact Number</th>
                           <td className='bgwhite'> {orderDetails.user_mobile}</td>
                        </tr>
                        <tr>
                           <th>Order Status</th>
                           <td className='bgwhite'> {orderDetails.status_title}</td>
                           <th>Total Amount</th>
                           <td className='bgwhite'> {orderDetails.order_total}</td>
                        </tr>
                     </thead>
                  </table>
               </div>
               <div className="table-responsive">
                  <h4 className='myhead'>Order Items</h4>
                  <table className="table table-striped table-hover">
                     <thead className="thead-dark">
                        <tr>
                           <th>Product ID</th>
                           <th>Image</th>
                           <th>Product Name</th>
                           <th>Total Items</th>
                           <th>Cost Per Unit</th>
                           <th>Total Cost</th>
                        </tr>
                     </thead>
                     <tbody>
                        {
                           ItemDetails
                              .map(items =>
                                 <tr>
                                    <td>{items.product_id}</td>
                                    <td><img className="my-thumbnail" src={"http://127.0.0.1:8080/uploads/" + items.product_image} /></td>
                                    <td>{items.product_title}</td>
                                    <td>{items.sell_units} Items</td>
                                    <td>{Parser(config.currency_symbol)} {items.sell_price_per_unit}</td>
                                    <td>{Parser(config.currency_symbol)} {items.sell_total_cost}</td>
                                 </tr>
                              )
                        }
                        <tr style={{display:display}}>
                           <th colspan="5" className="thead-dark" style={{textAlign:"right"}}>Total Cost : </th>
                           <th className="thead-dark">{Parser(config.currency_symbol)} {orderDetails.order_total}</th>
                        </tr>
                     </tbody>
                  </table>
                  <div className='printbutton'>
                     <button type="button" className="btn btn-danger" onClick={() =>window.print()}>Print Receipt</button>
                  </div>
               </div>
            </div >
         </section >
      </section >
   )
}

export default OrderDetails;