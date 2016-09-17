package nslm2.modules.footstones.alerts
{
   import nslm2.nets.sockets.DataNotifyCacheVo;
   import nslm2.common.model.ChangePlayerData;
   import nslm2.common.model.ChangePlayerWealthVo;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import flash.geom.Point;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.vo.WealthVo;
   import proto.Item;
   import nslm2.utils.WealthUtil;
   import proto.BaoWu;
   import proto.HeroInfo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.getItemsDisplayModule.vo.GetItemDisplayModuleParam;
   import nslm2.modules.foundations.noticeModule.vo.NoticeVo;
   import nslm2.modules.foundations.noticeModule.model.NoticeModel;
   
   public class FloatUtil
   {
       
      
      public function FloatUtil()
      {
         super();
      }
      
      public static function floatPlayerDataChange(param1:DataNotifyCacheVo) : void
      {
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:ChangePlayerData = param1.change;
         var _loc8_:Vector.<ChangePlayerWealthVo> = _loc2_.wealthArr;
         var _loc6_:int = _loc8_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = _loc8_[_loc7_];
            if(_loc3_.kind == 2 && param1.triggerCmd == 8006)
            {
               if(GlobalRef.playerHeader && ModuleMgr.ins.isShow(10400))
               {
                  if(_loc3_.count > 0)
                  {
                     _loc5_ = LocaleMgr.ins.getStr(3000 + _loc3_.kind) + " +" + _loc3_.count;
                     _loc5_ = TextFieldUtil.htmlText(_loc5_,new TextFormat(Styles.fontName,12,458496));
                     _loc4_ = GlobalRef.playerHeader.btn_addStamina.localToGlobal(new Point(GlobalRef.playerHeader.btn_addStamina.width + 10));
                     ObserverMgr.ins.sendNotice("floatMsgAt",new AlertMsgVo(_loc5_,null,null,_loc4_,-20,null).setGroup(16).set_useBg(false));
                  }
               }
            }
            else
            {
               floatWealth(_loc3_.kind,_loc3_.count);
            }
            _loc7_++;
         }
         if(_loc2_.ability > 0)
         {
         }
         if(_loc2_.lv > 0)
         {
            floatWealth(1010,_loc2_.lv);
         }
         if(_loc2_.totalExp > 0)
         {
            floatWealth(10,_loc2_.totalExp);
         }
         if(_loc2_.addItems)
         {
            FloatUtil.floatAddItems(_loc2_.addItems);
         }
         if(_loc2_.addBaowu)
         {
            FloatUtil.floatAddBaowus(_loc2_.addBaowu);
         }
      }
      
      public static function displayPlayerDataChange(param1:DataNotifyCacheVo, param2:Function = null, param3:int = 0, param4:String = null) : void
      {
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc6_:* = null;
         var _loc5_:ChangePlayerData = param1.change;
         var _loc10_:Vector.<ChangePlayerWealthVo> = _loc5_.wealthArr;
         var _loc8_:int = _loc10_.length;
         var _loc9_:Array = [];
         _loc12_ = 0;
         while(_loc12_ < _loc8_)
         {
            _loc6_ = _loc10_[_loc12_];
            if(_loc6_.count > 0)
            {
               _loc11_ = new WealthVo();
               _loc11_.kind = _loc6_.kind;
               _loc11_.count = _loc6_.count;
               _loc9_.push(_loc11_);
            }
            _loc12_++;
         }
         if(_loc5_.addItems)
         {
            var _loc16_:int = 0;
            var _loc15_:* = _loc5_.addItems;
            for each(var _loc13_ in _loc5_.addItems)
            {
               _loc11_ = WealthUtil.itemToVo(_loc13_);
               _loc9_.push(_loc11_);
            }
         }
         if(_loc5_.addBaowu)
         {
            var _loc18_:int = 0;
            var _loc17_:* = _loc5_.addBaowu;
            for each(var _loc14_ in _loc5_.addBaowu)
            {
               _loc11_ = WealthUtil.treasureToVo(_loc14_);
               _loc9_.push(_loc11_);
            }
         }
         if(_loc5_.addHeroes)
         {
            var _loc20_:int = 0;
            var _loc19_:* = _loc5_.addHeroes;
            for each(var _loc7_ in _loc5_.addHeroes)
            {
               _loc11_ = WealthUtil.heroInfoToVo(_loc7_);
               _loc9_.push(_loc11_);
            }
         }
         if(_loc9_.length > 0)
         {
            if(ModuleMgr.ins.isShow(11000) && param3 == 0)
            {
               showGetItemsDisplayPanel(_loc9_,param4,param2,11000);
            }
            else
            {
               showGetItemsDisplayPanel(_loc9_,param4,param2,param3);
            }
         }
      }
      
      public static function floatWealth(param1:int, param2:Number) : void
      {
         var _loc3_:String = LocaleMgr.ins.getStr(3000 + param1);
         if(param2 != 0)
         {
            if(param2 > 0)
            {
               _loc3_ = _loc3_ + (" +" + Number(param2));
               AlertUtil.float(_loc3_);
            }
            else
            {
               _loc3_ = _loc3_ + (" -" + Number(-param2));
            }
         }
      }
      
      public static function floatAddItems(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            floatAddItemByStcItemId(_loc2_.itemId,_loc2_.count);
            _loc4_++;
         }
      }
      
      public static function floatAddBaowus(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            floatAddItemByStcItemId(_loc2_.baseId,1);
            _loc4_++;
         }
      }
      
      public static function floatAddItemByStcItemId(param1:int, param2:int) : void
      {
         var _loc4_:StcItemVo = StcMgr.ins.getItemVo(param1);
         var _loc3_:String = LocaleMgr.ins.getStr(999000108) + TextFieldUtil.htmlText(LocaleMgr.ins.getStr(_loc4_.name),new TextFormat(null,null,ColorLib.qualityColor(_loc4_.quality))) + " x" + param2;
         AlertUtil.float(_loc3_);
      }
      
      public static function showGetItemsDisplayPanel(param1:Array, param2:String = null, param3:* = null, param4:int = 0, param5:Boolean = true, param6:int = 0, param7:Boolean = true, param8:String = null) : void
      {
         var _loc9_:GetItemDisplayModuleParam = new GetItemDisplayModuleParam();
         _loc9_.items = param1;
         _loc9_.titleTxt = param2;
         _loc9_.getIconFlyPosFunction = param3;
         _loc9_.vipHintFuncId = param6;
         _loc9_.autoHide = param7;
         _loc9_.showDoubleTip = param8;
         if(param5)
         {
            ModuleMgr.ins.closeModule(96300);
            if(param4)
            {
               ModuleMgr.ins.showModule(96300,_loc9_,param4);
            }
            else
            {
               ModuleMgr.ins.showModule(96300,_loc9_,ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else
         {
            ModuleMgr.ins.closeModule(96300);
            ModuleMgr.ins.showModule(96300,_loc9_);
         }
      }
      
      public static function sendEventNotice(param1:Array, param2:String) : void
      {
         var _loc3_:* = null;
         if(param1.indexOf(1) > -1)
         {
            _loc3_ = new NoticeVo();
            _loc3_.content = param2;
            NoticeModel.ins.pushNotice(_loc3_);
         }
         if(param1.indexOf(2) > -1)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(param2,null,null,null,-200,null).setGroup(2));
         }
         if(param1.indexOf(3) > -1)
         {
            ObserverMgr.ins.sendNotice("MSG_CHAT_SYS_NOTICE",param2);
         }
         if(param1.indexOf(4) > -1)
         {
            ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP",param2);
         }
         if(param1.indexOf(5) > -1)
         {
            ObserverMgr.ins.sendNotice("MSG_CHAT_GUILD_SYS_NOTICE",param2);
         }
      }
   }
}
