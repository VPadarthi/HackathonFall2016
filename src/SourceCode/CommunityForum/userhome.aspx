﻿<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="userhome.aspx.cs" Inherits="userhome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Community Forum</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="tooplate_style.css" rel="stylesheet" type="text/css" />
<link href="css/cbdb-search-form.css" type="text/css" rel="stylesheet" media="screen" />
<%--<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />--%>
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lobster" />

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />

<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>

<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
 


    <style type="text/css">
        .display_paginate 
        {
        color: #FB4C19;
        }
        .style1
        {
            width: 101%;
            height: 189px;
        }
        .style2
        {
            font-family: Lobster,Arial,sans-serif;
            height: 157px;
        }
        .style4
        {
            width: 186px;
            /*font-family: "Times New Roman", Times, serif;*/
            font-size: medium;
            text-align: center;
            color:white;
        }
        .style6
        {
            /*font-family: "Times New Roman", Times, serif;*/
            font-size: medium;
        }
        .style7
        {
            width:100px;
            /*font-family: "Times New Roman", Times, serif;*/
            font-size: medium;
             color:white;
        }
         .style8
        {
            width: 600px;
            /*font-family: "Times New Roman", Times, serif;*/
            font-size: medium;
            text-align: justify;
             color:white;
        }
        </style>
    <style type="text/css">
    
    </style>

</head>
<body>
<form runat="server">
<div id="tooplate_wrapper">
	<div id="tooplate_header">
        <div style="text-align:center; margin-top:50px;">
          
       <h1 style="color:#d9d9d9;font-size:130px">Community Forum</h1>
            </div>
        <div id="site_title"></div>
    </div> <!-- end of forever header -->
     <div>
        <ul class="fancyNav">
            <li><a href="userhome.aspx" class="current">Home</a></li>
            <li><a href="userposts.aspx">My Posts</a></li>
          
            <li><a href="logout.aspx" class="last">Logout</a></li>
        </ul>    	
    </div> <!-- end of tooplate_menu -->
      
    <div id="tooplate_main">
       	<div id="tooplate_content">
           		<div id="homepage_slider">
                   <table class="style1">
                            <tr>
                                <td class="style4">
                                    Category</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="330px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="2">
                                    <asp:TextBox ID="TextBox2" Width="100%" TextMode="MultiLine" Rows="5" 
                                        runat="server" Height="149px"></asp:TextBox>
                                </td>
                              
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="Button1" runat="server" Text="Clear" onclick="Button1_Click" />
                                     <asp:Button ID="Button2" runat="server" Text="Post" onclick="Button2_Click" />
                                    &nbsp;</td>
                                
                               
                            </tr>
                        </table>

                        

                     
                </div>
                
        </div>
        
   
         <div class="cleaner">

          <table>
         <tr>
        <td class="style7">Search By:</td>
        <td class="style8">
           <asp:CheckBox ID="CheckBox1" runat="server" />Author&nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="CheckBox2" runat="server" /> Tag&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:CheckBox ID="CheckBox3" runat="server" /> Category&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:CheckBox ID="CheckBox4" runat="server" />           Question&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
        </td>            
         <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>   
         <td><asp:Button ID="Button4" runat="server" Text="Search" onclick="Button4_Click" /></td>     
        </tr>
        
        </table>
         
         <asp:GridView ID="GridView1" Visible="false" ViewStateMode="Disabled" runat="server" Width="100%" CellPadding="3" OnRowCommand="gv_RowCommand" 
               BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" 
                BorderWidth="1px" CellSpacing="2" HorizontalAlign="Center"  AllowPaging="true" PageSize="10"
                AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging"> 
                 
            <Columns>
              <asp:TemplateField Visible="false" HeaderText="Post ID">
                 <ItemTemplate>
                <asp:Label ID="ID2" Visible="false" runat="server" Text='<%#Eval("postid")%>'></asp:Label>
               </ItemTemplate>             
         </asp:TemplateField>

        
     
        <asp:TemplateField HeaderText="Author">
                 <ItemTemplate>
                <asp:Label ID="ID12" runat="server" Text='<%#Eval("name")%>'></asp:Label>
               </ItemTemplate>             
         </asp:TemplateField>
       <asp:TemplateField HeaderText="Category">
             <ItemTemplate>
                <asp:Label ID="ID3" runat="server" Text='<%#Eval("title") %>'></asp:Label>
               </ItemTemplate>                  
        </asp:TemplateField>
                 <asp:TemplateField HeaderText="Question">
                 <ItemTemplate>
                <asp:Label ID="ID22" runat="server" Text='<%#Eval("post")%>'></asp:Label>
               </ItemTemplate>             
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Tags">
                  <ItemTemplate>
                <asp:Label ID="ID4" runat="server" Text='<%#Eval("tagname") %>'></asp:Label>
               </ItemTemplate>             
        </asp:TemplateField>
         <asp:TemplateField HeaderText="Posted Date">
                      <ItemTemplate>
                <asp:Label ID="ID5" runat="server" Text='<%#Eval("date1") %>'></asp:Label>
               </ItemTemplate>         
        </asp:TemplateField>   
       
       <asp:TemplateField HeaderText="Action">
     <ItemTemplate> 
      <asp:LinkButton ID="Button1"  runat="server" Text="View" CommandName="view" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'/>
    </ItemTemplate>
    </asp:TemplateField>  

    </Columns>
           
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
           
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" 
                    VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Center" VerticalAlign="Middle" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>



          <asp:GridView ID="GridView2" runat="server" Width="100%" CellPadding="3" OnRowCommand="gv_RowCommand1" 
                AllowPaging="True" PageSize="10" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" 
                BorderWidth="1px" CellSpacing="2" HorizontalAlign="Center" 
                AutoGenerateColumns="False" OnPageIndexChanging="GridView2_PageIndexChanging">
            <Columns>
              <asp:TemplateField Visible="false" HeaderText="Post ID">
                 <ItemTemplate>
                <asp:Label ID="ID2" Visible="false" runat="server" Text='<%#Eval("postid")%>'></asp:Label>
               </ItemTemplate>             
         </asp:TemplateField>

        
     
        <asp:TemplateField HeaderText="Author">
                 <ItemTemplate>
                <asp:Label ID="ID12" runat="server" Text='<%#Eval("name")%>'></asp:Label>
               </ItemTemplate>             
         </asp:TemplateField>
       <asp:TemplateField HeaderText="Category">
             <ItemTemplate>
                <asp:Label ID="ID3" runat="server" Text='<%#Eval("title") %>'></asp:Label>
               </ItemTemplate>                  
        </asp:TemplateField>
                  <asp:TemplateField  HeaderText="Question">
                 <ItemTemplate>
                <asp:Label ID="ID22"  runat="server" Text='<%#Eval("post")%>'></asp:Label>
               </ItemTemplate>             
         </asp:TemplateField>
         <asp:TemplateField HeaderText="Tags">
                  <ItemTemplate>
                <asp:Label ID="ID4" runat="server" Text='<%#Eval("tagname") %>'></asp:Label>
               </ItemTemplate>             
        </asp:TemplateField>
   
     <asp:TemplateField HeaderText="Posted Date">
                      <ItemTemplate>
                <asp:Label ID="ID5" runat="server" Text='<%#Eval("date1") %>'></asp:Label>
               </ItemTemplate>         
        </asp:TemplateField>   
       
       <asp:TemplateField HeaderText="Action">
     <ItemTemplate> 
      <asp:LinkButton ID="Button1"  runat="server" Text="View" CommandName="view" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>'/>
    </ItemTemplate>
    </asp:TemplateField>  

    </Columns>
           
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
           
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" 
                    VerticalAlign="Middle" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Center" VerticalAlign="Middle" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
         
         </div>
        
	</div> <!-- end of main -->
    
    <div id="tooplate_footer_wrapper">
       
    
	</div>
</div> <!-- end of wrapper -->
</form>

</body>
</html>