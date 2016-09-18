package nslm2.modules.funnies.guildPKCrossSer
{
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.utils.RTools;
   
   public class GPKConst
   {
      
      public static const STATUS_NO_OPEN:int = 0;
      
      public static const STATUS_WAIT_OPEN:int = 1;
      
      public static const STATUS_FIGHTING:int = 2;
      
      public static const STATUS_NO_QUALIFY:int = 3;
      
      public static const GPK_OPT_OPEN_CHALLENGE_PANEL:String = "GPK_OPT_OPEN_CHALLENGE_PANEL";
      
      public static const GPK_OPT_FIGHT:String = "GPK_OPT_FIGHT";
      
      public static const GPK_OPT_SURRENDER:String = "GPK_OPT_SURRENDER";
      
      public static const GPK_OPT_LOTTERY:String = "GPK_OPT_LOTTERY";
      
      public static const GPK_OPT_REFRESH_TASK_PANEL:String = "GPK_OPT_REFRESH_TASK_PANEL";
      
      public static const posZ:Array = [-800,-800,-800,-200,-200,-200];
      
      public static const num_per_page:int = 6;
      
      public static const rank_type_now:int = 1;
      
      public static var JUMP_PAGE:int = 5;
      
      public static var NUM_PER_PAGE:int = 5;
      
      public static var result_win:int = 2;
      
      public static var result_loss:int = 1;
      
      public static var task_no_get:int = 0;
      
      public static var task_no_comp:int = 1;
      
      public static var task_comp:int = 2;
      
      public static var task_fail:int = 3;
      
      public static var power_percent:int = 5;
      
      public static var power_strong:int = 1;
      
      public static var power_normal:int = 2;
      
      public static var power_weak:int = 3;
      
      public static const rank_type_zkxx:int = 0;
      
      public static const rank_type_kfpm:int = 1;
      
      public static const rank_type_grpm:int = 2;
      
      public static const rank_type_ghnpm:int = 3;
      
      public static const greencolor:uint = 11137387;
      
      public static const pos_winner_show:Array = [{
         "x":0,
         "y":-238,
         "scale":1.2
      },{
         "x":-263,
         "y":-216,
         "scale":1
      },{
         "x":-142,
         "y":-161,
         "scale":1
      },{
         "x":142,
         "y":-161,
         "scale":1
      },{
         "x":263,
         "y":-216,
         "scale":1
      }];
      
      public static const local_data_GPK_fast_fight:String = "local_data_GPK_fast_fight";
       
      
      public function GPKConst()
      {
         super();
      }
      
      public static function powerToW(param1:UInt64) : String
      {
         var _loc2_:Number = Uint64Util.toNumber(param1);
         return LocaleConsts.getNumberAbbr2(_loc2_.toString(),RTools.cl(1000,10000));
      }
      
      public static function getDistStr(param1:String, param2:uint, param3:String) : String
      {
         var _loc4_:* = null;
         _loc4_ = "S" + param2 % 10000;
         return [param1,_loc4_,param3].join(".");
      }
   }
}
