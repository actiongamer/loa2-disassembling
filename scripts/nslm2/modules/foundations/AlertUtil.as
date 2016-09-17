package nslm2.modules.foundations
{
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import flash.geom.Point;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.others.FightValueBoxS2;
   import flash.display.BitmapData;
   import nslm2.common.ui.components.comps2d.others.FightValueBoxS3;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.foundations.shop.BuyStamina;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.mall.model.MallModel;
   import nslm2.common.model.PlayerModel;
   
   public class AlertUtil
   {
       
      
      public function AlertUtil()
      {
         super();
      }
      
      public static function alert(param1:*, param2:* = null) : void
      {
         ObserverMgr.ins.sendNotice("simpleAlert",new AlertMsgVo(param1,param2,null));
      }
      
      public static function comfirm(param1:*, param2:* = null, param3:* = null, param4:String = null, param5:String = null, param6:String = null, param7:int = 0, param8:Boolean = true, param9:int = -1) : void
      {
         ObserverMgr.ins.sendNotice("simpleConfirm",new AlertMsgVo(param1,param2,param3,null,0,null,1,1,param8).setNoShowKey(param4).setConfirmStr(param5).setCancelStr(param6).setNoShowKey2(param7).setVipHint(param9));
      }
      
      public static function float(param1:*, param2:Point = null, param3:int = -1, param4:* = null, param5:Point = null, param6:int = 0) : void
      {
         if(param2)
         {
            ObserverMgr.ins.sendNotice("floatMsgAt",new AlertMsgVo(param1,param4,null,param2,param3,param5).setGroup(param6));
         }
         else
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(param1,param4,null,null,param3,param5).setGroup(param6));
         }
      }
      
      public static function floatErr(param1:String) : void
      {
         AlertUtil.float(TextFieldUtil.htmlText(param1,new TextFormat(null,24,16723968)));
      }
      
      public static function floatBottom(param1:String, param2:int = 0) : void
      {
         ObserverMgr.ins.sendNotice("floatMsgBottom",new AlertMsgVo(param1,null,null).setGroup(param2));
      }
      
      public static function floadNoOpenModule(param1:String = "") : void
      {
         float(param1 + LocaleMgr.ins.getStr(999000387));
      }
      
      public static function floadFuncTimeIsNotOpen(param1:uint = 0) : void
      {
         var _loc2_:String = param1 > 0?LocaleMgr.ins.getStr(9100000 + param1):LocaleMgr.ins.getStr(999000390);
         float(_loc2_ + LocaleMgr.ins.getStr(999000388));
      }
      
      public static function floadFuncTimeIsExpire(param1:uint = 0) : void
      {
         var _loc2_:String = param1 > 0?LocaleMgr.ins.getStr(9100000 + param1):LocaleMgr.ins.getStr(999000390);
         float(_loc2_ + LocaleMgr.ins.getStr(999000389));
      }
      
      public static function showFightPowerChangeTip(param1:int, param2:* = null, param3:Point = null, param4:Point = null) : void
      {
         var _loc5_:BitmapData = FightValueBoxS2.draw(param1);
         float(_loc5_,param4,-1,param2,param3,1);
      }
      
      public static function showTotalFightPowerChangeTip(param1:int, param2:* = null, param3:Point = null, param4:Point = null) : void
      {
         var _loc5_:BitmapData = FightValueBoxS3.draw(param1,11000810);
         float(_loc5_,param4,-1,param2,param3,1);
      }
      
      public static function showPropChangeTip(param1:String, param2:Number, param3:* = null, param4:Point = null, param5:Point = null) : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         if(param2 > 0)
         {
            _loc6_ = 458496;
         }
         else
         {
            _loc6_ = 16723968;
         }
         var _loc8_:String = NPCPropConsts.ins.showValue(param2,"+");
         var _loc9_:String = TextFieldUtil.htmlText(param1 + _loc8_,new TextFormat(null,20,_loc6_));
         float(_loc9_,param5,-1,param3,param4,1);
      }
      
      public static function showPropArrChangeTip(param1:Array, param2:* = null, param3:Point = null, param4:Point = null) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc5_ in param1)
         {
            showPropChangeTip(LocaleMgr.ins.getStr(2000 + _loc5_.propId),_loc5_.value,param2,param3,param4);
         }
      }
      
      public static function lackStamina(param1:Boolean = true) : void
      {
      }
      
      public static function lackLevel(param1:int = 0) : void
      {
         var _loc2_:ResGetPointModuleParam = new ResGetPointModuleParam();
         _loc2_.initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID));
         _loc2_.needNum = param1;
         ModuleMgr.ins.closeModule(12101);
         ModuleMgr.ins.showModule(12101,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public static function lackItem(param1:WealthVo) : void
      {
         var _loc2_:ResGetPointModuleParam = new ResGetPointModuleParam();
         _loc2_.initByWealthVo(param1);
         ModuleMgr.ins.closeModule(12101);
         ModuleMgr.ins.showModule(12101,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public static function lackVipLevel(param1:int) : void
      {
         comfirm(LocaleMgr.ins.getStr(60800030,[param1]),VipModel.ins.gotoCharge);
      }
      
      public static function lackGoldenDiamond() : void
      {
         if(MallModel.ins.goldenCanChangeLimit > 0)
         {
            if(PlayerModel.ins.getWealthValue(4) > 0)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(60900002),showChangeGoldenDiamondModule,null,null,LocaleMgr.ins.getStr(50200402));
            }
            else
            {
               showRechargeAlert();
            }
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(11200506),VipModel.ins.gotoCharge,null,null,LocaleMgr.ins.getStr(12110016));
         }
      }
      
      public static function showChangeGoldenDiamondModule() : void
      {
         ModuleMgr.ins.showModule(60901,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public static function showRechargeAlert() : void
      {
         ModuleMgr.ins.showModule(10101,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public static function FloatfuncNotOpen() : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(41210135));
      }
      
      public static function lackWealth(param1:int, param2:int = 0) : void
      {
         switch(int(param1) - 3)
         {
            case 0:
            case 1:
               AlertUtil.showRechargeAlert();
         }
      }
   }
}
