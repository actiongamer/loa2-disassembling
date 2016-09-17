package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcBgtitleIntvlVo extends StcVoBase
   {
      
      public static const TITLE_NEED_KIND:String = "title_need_kind";
      
      public static const KIND_BATTLEFIELD:int = 1;
      
      public static const KIND_CW:int = 2;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_bgtitle_intvl";
       
      
      public var id:int;
      
      public var tite_name:String;
      
      public var title_need_kind:String;
      
      public var title_need_num:String;
      
      public var title_reward:String;
      
      public var title_buff_id:int;
      
      public function StcBgtitleIntvlVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         tite_name = param1[1];
         title_need_kind = param1[2];
         title_need_num = param1[3];
         title_reward = param1[4];
         title_buff_id = param1[5];
      }
   }
}
