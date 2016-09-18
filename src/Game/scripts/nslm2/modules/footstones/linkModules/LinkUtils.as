package nslm2.modules.footstones.linkModules
{
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.text.TextFormat;
   import proto.PlayerBaseInfo;
   import com.netease.protobuf.UInt64;
   import com.mz.core.configs.EnvConfig;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import proto.Item;
   import morn.core.utils.BaUtil;
   import flash.utils.ByteArray;
   import nslm2.nets.imsdk.Base64;
   import proto.BaoWu;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   
   public class LinkUtils
   {
       
      
      public function LinkUtils()
      {
         super();
      }
      
      public static function href(param1:String, param2:String = null, param3:String = "_blank") : String
      {
         if(param2 == null)
         {
            param2 = param1;
         }
         return "<a href=\"" + param1 + "\" target=\"" + param3 + "\"><u>" + param2 + "</u></a>";
      }
      
      public static function evtString(param1:int, ... rest) : String
      {
         return param1 + "|" + rest.join("|");
      }
      
      public static function heroNameByInfo(param1:HeroInfo, param2:int = 12) : String
      {
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         var _loc3_:uint = ColorLib.qualityColor(_loc4_.quality);
         return TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(_loc4_.name),new TextFormat(null,param2,_loc3_),evtString(2,String(_loc4_.id)));
      }
      
      public static function playerNameByPlayerBaseInfo(param1:PlayerBaseInfo) : String
      {
         return playerNameSmart(param1.id,param1.name,param1.dist,ColorLib.getMilitaryColor(param1.militaryRank));
      }
      
      public static function playerNameSmart(param1:UInt64, param2:String, param3:int, param4:* = null, param5:* = null) : String
      {
         if(EnvConfig.ins.useServer && (param1 == null || Uint64Util.toNumber(param1) == 0 || Uint64Util.equal(PlayerModel.ins.playerInfo.id,param1)))
         {
            return TextFieldUtil.htmlText(param2,new TextFormat(null,param5,param4));
         }
         return playerName(param1,param2,param3,param4,param5);
      }
      
      public static function playerNameText(param1:String, param2:int) : String
      {
         var _loc3_:* = param1;
         if(param2)
         {
            switch(int(param2) - 1)
            {
               case 0:
                  _loc3_ = "[" + LocaleMgr.ins.getStr(5113) + "]" + param1;
                  break;
               case 1:
                  _loc3_ = "[" + LocaleMgr.ins.getStr(5111) + "]" + param1;
            }
         }
         return _loc3_;
      }
      
      public static function getGMTypeHTML(param1:int = 0) : String
      {
         if(param1)
         {
            switch(int(param1) - 1)
            {
               case 0:
                  return TextFieldUtil.htmlText2("[" + LocaleMgr.ins.getStr(5113) + "]",16723968);
               case 1:
                  return TextFieldUtil.htmlText2("[" + LocaleMgr.ins.getStr(5111) + "]",458496);
            }
         }
         return "";
      }
      
      public static function playerName(param1:UInt64, param2:String, param3:int, param4:* = null, param5:* = null, param6:int = 0, param7:int = 0) : String
      {
         var _loc8_:String = getGMTypeHTML(param6) + param2;
         return TextFieldUtil.linkHtmlText(_loc8_,new TextFormat(null,param5,param4),evtString(1,Uint64Util.toString(param1),param2,param3,param6,param7));
      }
      
      public static function fanChenMi(param1:String) : String
      {
         param1 = encodeURI(param1);
         return TextFieldUtil.linkHtmlText2("点击进入身份认证页面",evtString(11,param1),458496);
      }
      
      public static function stcItemName(param1:int, param2:* = null) : String
      {
         var _loc4_:* = 0;
         var _loc3_:StcItemVo = StcMgr.ins.getItemVo(param1);
         if(_loc3_ == null)
         {
            return "ERROR stcItem ID(" + param1 + ")";
         }
         _loc4_ = uint(ColorLib.qualityColor(_loc3_.quality));
         return TextFieldUtil.linkHtmlText("[" + LocaleMgr.ins.getStr(_loc3_.name) + "]",new TextFormat(null,param2,_loc4_),evtString(4,param1));
      }
      
      public static function stcHorseName(param1:int, param2:* = null) : String
      {
         var _loc3_:* = 0;
         var _loc4_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         if(_loc4_ == null)
         {
            return "ERROR StcSaddlehorseVo ID(" + param1 + ")";
         }
         _loc3_ = uint(ColorLib.qualityColor(_loc4_.quality));
         return TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(_loc4_.name),new TextFormat(null,param2,_loc3_),evtString(5,String(_loc4_.id)));
      }
      
      public static function stcNpcName(param1:int, param2:* = null) : String
      {
         var _loc3_:* = 0;
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param1);
         if(_loc4_ == null)
         {
            return "ERROR stcNpc ID(" + param1 + ")";
         }
         _loc3_ = uint(ColorLib.qualityColor(_loc4_.quality));
         return TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(_loc4_.name),new TextFormat(null,param2,_loc3_),evtString(2,String(_loc4_.id)));
      }
      
      public static function itemName(param1:Item, param2:Object = null, param3:int = 0) : String
      {
         var _loc6_:StcItemVo = StcMgr.ins.getItemVo(param1.itemId);
         var _loc7_:uint = ColorLib.qualityColor(_loc6_.quality);
         var _loc5_:ByteArray = BaUtil.createByteArray();
         param1.writeTo(_loc5_);
         BaUtil.compress(_loc5_);
         var _loc8_:String = Base64.encodeByteArray(_loc5_);
         var _loc4_:String = "[" + LocaleMgr.ins.getStr(_loc6_.name) + "]";
         if(!(int(param3) - 2))
         {
            _loc4_ = _loc4_ + ("x" + param1.count);
         }
         return TextFieldUtil.linkHtmlText(_loc4_,new TextFormat(null,param2,_loc7_),evtString(3,_loc8_));
      }
      
      public static function treasureName(param1:BaoWu, param2:Object = null, param3:int = 0) : String
      {
         var _loc6_:StcItemVo = StcMgr.ins.getItemVo(param1.baseId);
         var _loc7_:uint = ColorLib.qualityColor(_loc6_.quality);
         var _loc5_:ByteArray = BaUtil.createByteArray();
         param1.writeTo(_loc5_);
         BaUtil.compress(_loc5_);
         var _loc8_:String = Base64.encodeByteArray(_loc5_);
         var _loc4_:String = "[" + LocaleMgr.ins.getStr(_loc6_.name) + "]";
         if(!(int(param3) - 2))
         {
            _loc4_ = _loc4_ + "x1";
         }
         return TextFieldUtil.linkHtmlText(_loc4_,new TextFormat(null,param2,_loc7_),evtString(99,_loc8_));
      }
      
      public static function teamGuajiInvite(param1:uint, param2:* = null) : String
      {
         return TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(41210095),new TextFormat(null,param2,458496),evtString(7,param1));
      }
      
      public static function wealthVo(param1:String, param2:* = null, param3:int = 0) : String
      {
         var _loc6_:WealthVo = WealthUtil.parseCostStr(param1);
         var _loc5_:uint = ColorLib.qualityColor(_loc6_.quality);
         var _loc4_:String = "[" + _loc6_.showName + "]";
         if(!(int(param3) - 2))
         {
            _loc4_ = _loc4_ + ("x" + _loc6_.showCount);
         }
         return TextFieldUtil.linkHtmlText(_loc4_,new TextFormat(null,param2,_loc5_),evtString(9,param1));
      }
      
      public static function teamGuajiPublicInvite(param1:UInt64, param2:* = null) : String
      {
         return LocaleMgr.ins.getStr(41210093) + TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(41210095),new TextFormat(null,param2,458496),evtString(7,param1));
      }
      
      public static function battlefieldPublicInvite(param1:UInt64, param2:* = null) : String
      {
         return LocaleMgr.ins.getStr(50500140) + TextFieldUtil.linkHtmlText(LocaleMgr.ins.getStr(41210095),new TextFormat(null,param2,458496),evtString(10,param1));
      }
      
      public static function openFriendCommend(param1:String = null) : String
      {
         if(param1 == null)
         {
            param1 = LocaleMgr.ins.getStr(10600030);
         }
         return TextFieldUtil.linkHtmlText2(param1,evtString(531,10601));
      }
   }
}
