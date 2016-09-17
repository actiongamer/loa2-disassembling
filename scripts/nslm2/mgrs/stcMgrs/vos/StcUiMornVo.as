package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcUiMornVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_ui_morn";
       
      
      public var id:int;
      
      public var path_1:String;
      
      public var path_2:String;
      
      public var path_3:String;
      
      public var name:String;
      
      public var name2:String;
      
      public var desc:String;
      
      public var path_11:String;
      
      public var path_22:String;
      
      public function StcUiMornVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         path_1 = param1[1];
         path_2 = param1[2];
         path_3 = param1[3];
         name = param1[4];
         name2 = param1[5];
         desc = param1[6];
         path_11 = param1[7];
         path_22 = param1[8];
      }
   }
}
