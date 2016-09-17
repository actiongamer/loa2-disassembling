package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcNvshendianRandomjiangliVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_nvshendian_randomjiangli";
       
      
      public var id:int;
      
      public var jiangli_neirong:String;
      
      public var weight:int;
      
      public var allstar:String;
      
      public var show_reward:String;
      
      public function StcNvshendianRandomjiangliVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         jiangli_neirong = param1[1];
         weight = param1[2];
         allstar = param1[3];
         show_reward = param1[4];
      }
   }
}
