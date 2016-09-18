package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class StcFunctionVo extends StcVoBase
   {
      
      public static const LEVEL:String = "level";
      
      public static const KIND:String = "kind";
      
      public static const IS_SHOW:String = "is_show";
      
      public static const ISOPEN_NO:int = 0;
      
      public static const ISOPEN_YES:int = 1;
      
      public static const ISOPEN_WAIT:int = 2;
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_function";
       
      
      public var id:int;
      
      public var gameid:int;
      
      public var kind:int;
      
      public var level:int;
      
      public var vip:int;
      
      public var icon:int;
      
      public var desc:String;
      
      public var total_desc:String;
      
      public var play_desc:String;
      
      public var rule_desc:String;
      
      public var reward_desc:String;
      
      public var display_reward:String;
      
      public var isopen:int;
      
      public var is_show:int;
      
      public var icon_symbol:String;
      
      public function StcFunctionVo()
      {
         super();
      }
      
      public function get canEnter() : Boolean
      {
         if(EnvConfig.ins.showDevModule)
         {
            return true;
         }
         if(this.isopen == 2)
         {
            return false;
         }
         return true;
      }
      
      public function get canOpen() : Boolean
      {
         if(EnvConfig.ins.showDevModule && false)
         {
            return true;
         }
         if(this.isopen == 0)
         {
            return false;
         }
         return true;
      }
      
      public function get descString() : String
      {
         return LocaleMgr.ins.getStr(desc);
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         gameid = param1[1];
         kind = param1[2];
         level = param1[3];
         vip = param1[4];
         icon = param1[5];
         desc = param1[6];
         total_desc = param1[7];
         play_desc = param1[8];
         rule_desc = param1[9];
         reward_desc = param1[10];
         display_reward = param1[11];
         isopen = param1[12];
         is_show = param1[13];
         icon_symbol = param1[14];
      }
   }
}
