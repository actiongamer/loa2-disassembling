package org.specter3d.net
{
   public class NetErrorMesg
   {
      
      public static const SOCKET_IO_ERROR:String = "001";
      
      public static const SOCKET_IO_ERROR_MESG:String = "IO_Error";
      
      public static const SOCKET_SECURITY_ERROR:String = "002";
      
      public static const SOCKET_SECURITY_ERROR_MESG:String = "Security_Error";
       
      
      public var errorCode:String;
      
      public var errorMesg:String;
      
      public function NetErrorMesg()
      {
         super();
      }
   }
}
