package global
{
   public class StcUiPublishVo
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_ui_publish";
       
      
      public var id:int;
      
      public var path_1:String;
      
      public var name:String;
      
      public var desc:String;
      
      public var path_2:String;
      
      public var folder:String;
      
      public var path_3:String;
      
      public function StcUiPublishVo()
      {
         super();
      }
      
      public function parse(param1:Array) : void
      {
         id = param1[0];
         path_1 = param1[1];
         name = param1[2];
         desc = param1[3];
         path_2 = param1[4];
         folder = param1[5];
         path_3 = param1[6];
      }
   }
}
