package nslm2.modules.footstones.localeModules
{
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.ServerTimer;
   import morn.customs.StyleLib;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.utils.MathUtil;
   import org.specter3d.utils.StringUtil;
   
   public class LocaleConsts
   {
      
      public static const SplitSemicolon:String = ";";
      
      public static const SplitHLine:String = "|";
      
      public static const SplitDot:String = ".";
      
      public static const SplitColon:String = ":";
      
      public static const SplitComma:String = ",";
      
      public static const Plus:String = "+";
      
      public static const Minus:String = "-";
      
      public static const ServerPrefix:String = "S";
      
      public static const CARDINAL_NPC_PROP_NAME_LONG:int = 1000;
      
      public static const CARDINAL_NPC_PROP_NAME_SIMPLE:int = 1100;
      
      public static const CARDINAL_NPC_PROP_NAME_SIMPLE2:int = 1200;
      
      public static const CARDINAL_NPC_PROP_NAME_NORMAL:int = 2000;
      
      public static const CARDINAL_WEALTH:int = 3000;
      
      public static const CARDINAL_WEALTH_DESC:int = 3100;
      
      public static const CARDINAL_WEALTH_GET_POINT:int = 3200;
      
      public static const CARDINAL_NPC_GENDER:int = 4000;
      
      public static const CARDINAL_NPC_CAREER:int = 5000;
      
      public static const CARDINAL_QUALITY:int = 6000;
      
      public static const CARDINAL_PHASE:int = 7000;
      
      public static const CARDINAL_ITEM_KIND:int = 8000;
      
      public static const CARDINAL_ITEM_DISPLAY_TYPE:int = 4100;
      
      public static const CARDINAL_MODULE_NAME:int = 9000000;
      
      public static const CARDINAL_MODULE_NAME_SPACE:int = 9100000;
      
      public static const CARDINAL_MODULE_TOOLTIP:int = 9700000;
      
      public static const CARDINAL_MODULE_ACTION_NAME:int = 9800000;
      
      public static const ROLE_PROPERTY_DETAIL:int = 30100900;
      
      public static const ROLE_GROUP_NAME:int = 5100;
      
      public static const ROLE_GROUP_TIP:int = 30100310;
      
      public static const ROLE_GROUP_NAME_DETAIL:int = 30100310;
      
      public static const NPC_CARRER_TYPE_BASE:int = 30100020;
      
      public static const NPC_CARRER_INFO_BASE:int = 30100024;
      
      public static const AUTO_SELECT_TREASURE_LABLE_BASE:int = 30600000;
      
      public static const RUNE_TYPE_NAME_BASE:int = 30600100;
      
      public static const RESTRICTIVE_CONDITION_BASE:int = 11200100;
      
      public static const SKILL_TYPE_BASE:int = 4200;
      
      public static const SKILL_TYPE_PREFIX:int = 4300;
      
      public static const GUAJI_NANDU_BASE:int = 41210800;
      
      public static const HERO_TITLE:int = 999800000;
      
      public static const SHOP_ALERT_PREFIX:int = 41300000;
       
      
      public function LocaleConsts()
      {
         super();
      }
      
      public static function spaceWidth(param1:int = 12) : Number
      {
         if(param1 < 16)
         {
            return 4;
         }
         return 5;
      }
      
      public static function get EXP() : String
      {
         return LocaleMgr.ins.getStr(3000 + 10);
      }
      
      public static function getRatingStr(param1:Number) : String
      {
         var _loc2_:int = 0;
         if(param1 <= 0.01)
         {
            return TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100202),new TextFormat(null,null,14210735));
         }
         if(param1 <= 0.1)
         {
            return TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100203),new TextFormat(null,null,7329076));
         }
         if(param1 <= 0.3)
         {
            return TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100204),new TextFormat(null,null,4827135));
         }
         if(param1 <= 0.5)
         {
            return TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100205),new TextFormat(null,null,12798193));
         }
         return TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30100206),new TextFormat(null,null,16542720));
      }
      
      public static function percentStr(param1:Number) : String
      {
         var _loc2_:String = (Number(param1 * 100)).toFixed(1) + "%";
         if(_loc2_.indexOf(".0") == -1)
         {
            return _loc2_;
         }
         return _loc2_.replace(".0","");
      }
      
      public static function percentStrInt(param1:int) : String
      {
         return param1 + "%";
      }
      
      public static function percentStrFixed(param1:Number, param2:int) : String
      {
         var _loc3_:Number = param1 * 100;
         var _loc5_:String = _loc3_.toFixed(param2);
         var _loc6_:Array = _loc5_.split(".");
         if(_loc6_.length > 0 && _loc6_[1] == "0")
         {
            _loc6_.pop();
         }
         var _loc4_:String = _loc6_.join(".") + "%";
         if(param2 == 1)
         {
            _loc4_.replace(".0","");
         }
         return _loc4_;
      }
      
      public static function lvStr(param1:int) : String
      {
         return LocaleMgr.ins.getStr(999902556,[param1]);
      }
      
      public static function gradeStr(param1:int) : String
      {
         return param1 + LocaleMgr.ins.getStr(11700023);
      }
      
      public static function max() : String
      {
         return "max";
      }
      
      public static function fightValue(param1:*) : String
      {
         return LocaleMgr.ins.getStr(999000110) + param1;
      }
      
      public static function no(param1:*) : String
      {
         return "No." + param1;
      }
      
      public static function offtime(param1:Number) : String
      {
         if(param1)
         {
            return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000111) + TimeUtils.oneCN(ServerTimer.ins.second - param1),StyleLib.ins.getConfigVo("普通灰色").color);
         }
         return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000112),StyleLib.ins.getConfigVo("普通说明").color);
      }
      
      public static function getNumberAbbr(param1:String) : String
      {
         var _loc2_:Array = param1.split("%");
         var _loc3_:Number = _loc2_[0];
         if(_loc3_ < 10000)
         {
            return _loc2_.join("%");
         }
         _loc2_[0] = int(_loc3_ / 10000) + LocaleMgr.ins.getStr(999000113);
         return _loc2_.join("%");
      }
      
      public static function getNumberAbbr2(param1:String, param2:int = 1000000) : String
      {
         var _loc3_:Number = Math.floor(Number(param1));
         if(_loc3_ < param2)
         {
            return String(_loc3_);
         }
         if(_loc3_ < 1000000000)
         {
            if(ClientConfig.isChineseLang())
            {
               return Math.floor(_loc3_ / 10000) + LocaleMgr.ins.getStr(999000113);
            }
            return Math.floor(_loc3_ / 1000) + LocaleMgr.ins.getStr(999000113);
         }
         return Math.floor(_loc3_ / 100000000) + LocaleMgr.ins.getStr(999000114);
      }
      
      public static function getNumberAbbr3(param1:String, param2:int = 0) : String
      {
         var _loc3_:Number = MathUtil.floor(Number(param1),param2);
         if(_loc3_ < 10000)
         {
            return String(_loc3_);
         }
         if(_loc3_ < 1000000000)
         {
            if(ClientConfig.isChineseLang())
            {
               return MathUtil.floor(_loc3_ / 10000,param2) + LocaleMgr.ins.getStr(999000113);
            }
            return MathUtil.floor(_loc3_ / 1000,param2) + LocaleMgr.ins.getStr(999000113);
         }
         return MathUtil.floor(_loc3_ / 100000000,param2) + LocaleMgr.ins.getStr(999000114);
      }
      
      public static function splitNumberByComma(param1:Number) : String
      {
         var _loc2_:int = param1;
         var _loc3_:Array = [];
         while(_loc2_ >= 1000)
         {
            _loc3_.push(StringUtil.leadingZero(_loc2_ % 1000,3));
            _loc2_ = _loc2_ / 1000;
         }
         _loc3_.push(_loc2_.toString());
         return _loc3_.reverse().join(",");
      }
      
      public static function clearParamStr(param1:String) : String
      {
         return param1.replace(LocaleMgr.reg,"");
      }
   }
}
