
import axios from 'axios';
import Parser from 'html-react-parser';
import React, { useState, useEffect, Fragment } from 'react'
import { confirmAlert } from 'react-confirm-alert'; // Import
import { useNavigate, useParams, useLocation } from 'react-router-dom';
import 'react-confirm-alert/src/react-confirm-alert.css'; // Import css
import { Link } from 'react-router-dom';
import config from '../../utils/config';

const OrderReport = () => {

   // Function for edit //
   let { id } = useParams();
   const location = useLocation();


   const [order, setData] = useState([]);
   const [search_text, setSearchData] = useState([]);
   const [filteredData, setFilteredData] = useState([]);

   // Alert message for displaying success and error ////
   const [message, setMessage] = useState({
      show_message: false,
      error_type: '',
      msg: ''
   });
   /**
    * Function for getting lists
    */
   useEffect(() => {
      if (location.state != null) {
         setMessage({
            show_message: true,
            error_type: location.state.error_type,
            msg: location.state.msg
         });
      }

      /* Show Orders to Admin */
      if(window.sessionStorage.getItem("user_level_id") == "1") {
         axios.get(`${config.api_url}/orders/all-orders`)
         .then(res => {
            const orders = res.data;
            setData(orders);
            setFilteredData(orders);
            console.log(orders);
         })
      }

      /* Show Orders to Customer */
      if(window.sessionStorage.getItem("user_level_id") == "2") {
         axios.get(`${config.api_url}/orders/user-orders/${window.sessionStorage.getItem("user_id")}`)
         .then(res => {
            const orders = res.data;
            setData(orders);
            setFilteredData(orders);
            console.log(orders);
         })
      }

      /* Show Orders to Delivery Partner */
      if(window.sessionStorage.getItem("user_level_id") == "3") {
         axios.get(`${config.api_url}/orders/delivery-orders/${window.sessionStorage.getItem("user_id")}`)
         .then(res => {
            const orders = res.data;
            setData(orders);            
            setFilteredData(orders);
            console.log(orders);
         })
      }

      /* Show Orders to Vendors */
      if(window.sessionStorage.getItem("user_level_id") == "4") {
         axios.get(`${config.api_url}/orders/vendor-orders/${window.sessionStorage.getItem("user_id")}`)
         .then(res => {
            const orders = res.data;
            setData(orders);            
            setFilteredData(orders);
            console.log(orders);
         })
      }

   }, []);

   const reset_search = () => {
      search_text.search_text = '';
      setFilteredData(order);
   };

   const search_data = () => {
      const newData = order.filter(order => {
         return order.user_name.toLowerCase().includes(search_text.search_text.toLowerCase())
            || order.order_id.toLowerCase().includes(search_text.search_text.toLowerCase())
            || order.status_title.toLowerCase().includes(search_text.search_text.toLowerCase());
      });

      if (search_text.search_text) {
         setFilteredData(newData);
      } else {
         setFilteredData(order);
      }
   };

   // Handlinng Change Event
   const onChange = (e) =>
      setSearchData({ [e.target.name]: e.target.value });

   return (
      <section>
         <section id="inner-headline">
            <div className="container">
               <div className="row">
                  <div className="col-lg-12">
                  <h2 className="pageTitle">
                     {
                        window.sessionStorage.getItem("user_level_id") == "1"  ? ( "All Orders Report" ) : 
                        window.sessionStorage.getItem("user_level_id") == "2"  ? ( "My Orders" ) : 
                        ( "My Deliveries" )
                     }
                     </h2>
                  </div>
               </div>
            </div>
         </section>
         <section id="content">
            <div className="container content">
               <div className="row">
                  <div className="col-md-12">
                     <form className="form-horizontal search_box">
                        <div className="form-group">
                           <label className="col-sm-2" htmlFor="email">Search :</label>
                           <div className="col-sm-4">
                              <input type="text" onChange={e => onChange(e)} name="search_text" className="form-control" placeholder="Search Order" required />
                           </div>
                           <div className="col-sm-4">
                              <button type="button" className="btn btn-default" onClick={search_data}>Search</button>&nbsp;&nbsp;
                              <button type="reset" className="btn btn-danger" onClick={reset_search}>Reset</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div>
                  {message.show_message ? (
                     <div className={'alert ' + message.error_type} role="alert">
                        {message.msg}
                     </div>
                  ) : (
                     ''
                  )}
               </div>
               <div className="row">
                  <table className="table table-striped table-bordered table-hover">
                     <thead className="thead-dark">
                        <tr>
                           <th scope="col">ID</th>
                           <th scope="col">User Name</th>
                           <th scope="col">Order Date</th>
                           <th scope="col">Total Amount</th>
                           <th scope="col">Status</th>
                           <th scope="col">Action</th>
                        </tr>
                     </thead>
                     <tbody>
                        {
                           filteredData
                              .map(order =>
                                 <tr>
                                    <th scope="row">{order.order_id}</th>
                                    <td>{order.user_name}</td>
                                    <td>{order.order_date}</td>
                                    <td>{Parser(config.currency_symbol)}  {order.order_total}</td>
                                    <td className={order.order_status}>{order.status_title}</td>
                                    <td>
                                    {window.sessionStorage.getItem("user_level_id") != "2"  ? (
                                       <Link to={"/order-edit/"+order.order_id}>
                                       <span className="glyphicon glyphicon-edit editi"></span>
                                       </Link>
                                    ) : (
                                       ''
                                    )}
                                       &nbsp;&nbsp;<Link to={"/order-details/" + order.order_id}>
                                          <span className="glyphicon glyphicon-check checki"></span>
                                       </Link>&nbsp;&nbsp;
                                    </td>
                                 </tr>
                              )
                        }
                     </tbody>
                  </table>
               </div>
            </div>
         </section>
      </section>
   )
}
export default OrderReport;
