package nslm2.modules.scenes.mainCitys
{
   import game.ui.resourceDg.ResBossSelectPanelUI;
   import proto.HeroPracticeSaoDangReq;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeNanduVo;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.nets.sockets.ServerEvent;
   import proto.HeroPracticeSaoDangRes;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.common.ui.components.comps2d.others.QQBuyTimesRender;
   import nslm2.modules.foundations.TimePriceUtil;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS2;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.common.ctrls.ListPageBarCtrl;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeTypeVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import proto.HeroPracticeEnterNodeReq;
   import proto.HeroPracticeNanduInfo;
   import proto.HeroPracticeEnterNodeRes;
   import nslm2.modules.foundations.vip.view.VipHintBox;
   import morn.customs.FilterLib;
   import nslm2.utils.LabelUtils;
   import nslm2.utils.RTools;
   
   public class ResBossSelectPanel extends ResBossSelectPanelUI
   {
       
      
      private var _right:Number = 20;
      
      private var _inSaoDang:Boolean = false;
      
      private var _taskAlertRender:TaskAlertRenderS2;
      
      private var _bossArr:Array;
      
      private var _listCtrl:ListPageBarCtrl;
      
      public var currTypeVo:StcHeropracticeTypeVo;
      
      private var _nodeRes:HeroPracticeEnterNodeRes;
      
      private var _currSelectVo:Object;
      
      private var vipHintBox:VipHintBox;
      
      public function ResBossSelectPanel()
      {
         super();
         _listCtrl = new ListPageBarCtrl(this.list_boss,null,this.btn_left,this.btn_right,null,null);
         this.parts.push(new ListPageBarCtrl(this.list_boss,null,this.btn_left,this.btn_right,null,null));
         this.list_boss.changeHandler = chgHandler;
         this.list_boss.selectEnable = true;
         this.btn_fight.clickHandler = fightClick;
         this.btn_buytimes.clickHandler = buyTimes;
         this.btn_saodang.clickHandler = saodangClick;
      }
      
      private function saodangClick() : void
      {
         var _loc1_:HeroPracticeSaoDangReq = new HeroPracticeSaoDangReq();
         _loc1_.nanduid = StcHeropracticeNanduVo(_currSelectVo.stc).id;
         _loc1_.typeid = StcHeropracticeNanduVo(_currSelectVo.stc).type1;
         ServerEngine.ins.send(7207,_loc1_,server_saoDangCpl);
      }
      
      private function server_saoDangCpl(param1:*, param2:ServerEvent) : void
      {
         onServerCpl_playerDataNotify(param1);
      }
      
      private function onServerCpl_playerDataNotify(param1:HeroPracticeSaoDangRes) : void
      {
         var _loc4_:Array = WealthUtil.rewardArrToWealthVoArr(param1.rewards);
         if(ActivityModel.ins.have(1009))
         {
            FloatUtil.showGetItemsDisplayPanel(_loc4_,null,null,0,true,0,true,LocaleMgr.ins.getStr(999000394));
         }
         else
         {
            FloatUtil.showGetItemsDisplayPanel(_loc4_,null,null,0,true,0,true);
         }
         var _loc3_:int = _nodeRes.shengyutimes;
         _loc3_ = _loc3_ - param1.totaltimes;
         _nodeRes.shengyutimes = Math.max(0,_loc3_);
         var _loc2_:int = NpcFuncService.ins.getVo(41400).count - param1.totaltimes;
         NpcFuncService.ins.changeCount(41400,_loc2_);
         setTimes();
      }
      
      private function buyTimes() : void
      {
         if(_taskAlertRender)
         {
            _taskAlertRender.dispose();
            _taskAlertRender = null;
         }
         var _loc1_:QQBuyTimesRender = new QQBuyTimesRender();
         _loc1_.curTimes(TimePriceUtil.curTimes(currTypeVo.type1));
         _loc1_.alert(LocaleMgr.ins.getStr(50200012,[TimePriceUtil.curTimePriceVo(currTypeVo.type1).count]) + "\n" + LocaleMgr.ins.getStr(50200107,[TimePriceUtil.curTimes(currTypeVo.type1),int(VipModel.ins.getVipValue(10310))]));
         if(TimePriceUtil.curTimes(currTypeVo.type1) < int(VipModel.ins.getVipValue(10310)))
         {
            AlertUtil.comfirm(_loc1_,buyTimes_yes,null,null,null,null,0,false,10310);
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(50200108));
         }
      }
      
      private function buyTimes_yes() : void
      {
         TimePriceUtil.buyTimes(currTypeVo.type1,1,addTimes,10310);
      }
      
      private function addTimes() : void
      {
         NpcFuncService.ins.countPlusOne(41400);
         _nodeRes.shengyutimes++;
         setTimes();
      }
      
      private function setTimes() : void
      {
         selectOneBoss(_currSelectVo,false);
         ObserverMgr.ins.sendNotice("RES_DG_SWITCH_BOSS_FIGHT_CURSOR",_nodeRes.shengyutimes > 0);
      }
      
      private function fightClick() : void
      {
         if(_currSelectVo)
         {
            ObserverMgr.ins.sendNotice("RES_DG_FIGHT",_currSelectVo);
         }
      }
      
      override public function fadeIn(param1:Number = 0, param2:int = 0) : void
      {
         right = -this.width - 10;
         TweenLite.to(this,0.3,{
            "right":_right,
            "onComplete":onInComp
         });
      }
      
      private function onInComp() : void
      {
         if(NGUtil.checkModuleShow(40500,this) == false)
         {
            if(FloatBubbleUtil.needShow(1110))
            {
               if(_taskAlertRender == null)
               {
                  _taskAlertRender = new TaskAlertRenderS2();
                  _taskAlertRender.x = 275;
                  _taskAlertRender.y = 15;
                  _taskAlertRender.show(1110);
               }
               if(this.btn_buytimes.visible == true)
               {
                  FloatBubbleUtil.addOneTime(1110.toString());
               }
               this.btn_buytimes.addChild(_taskAlertRender);
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
      }
      
      override public function fadeOut() : void
      {
         TweenLite.to(this,0.3,{
            "right":-this.width - 10,
            "onComplete":onComp
         });
      }
      
      private function onComp() : void
      {
         DisplayUtils.removeSelf(this);
      }
      
      private function chgHandler(param1:int) : void
      {
         var _loc2_:Object = (list_boss.getCell(param1) as ResBossRender).dataSource;
         if(_loc2_ == _currSelectVo)
         {
            return;
         }
         if(_loc2_.stc.locklevel > PlayerModel.ins.level)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(41400007,[_loc2_.stc.locklevel])));
         }
         selectOneBoss(_loc2_);
      }
      
      public function init(param1:StcHeropracticeTypeVo) : void
      {
         currTypeVo = param1;
         var _loc2_:Array = StcMgr.ins.getHeropracticeNanduTable().array;
         _bossArr = [];
         var _loc6_:int = 0;
         var _loc5_:* = _loc2_;
         for each(var _loc4_ in _loc2_)
         {
            if(_loc4_.type1 == param1.id)
            {
               _bossArr.push({"stc":_loc4_});
            }
         }
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(param1.name);
         var _loc3_:HeroPracticeEnterNodeReq = new HeroPracticeEnterNodeReq();
         _loc3_.nodeid = param1.id;
         ServerEngine.ins.send(7202,_loc3_,server_enter_return);
      }
      
      private function getSerVoById(param1:Array, param2:int) : HeroPracticeNanduInfo
      {
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.id == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private function server_enter_return(param1:HeroPracticeEnterNodeRes) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         _nodeRes = param1;
         var _loc2_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = _bossArr;
         for each(_loc4_ in _bossArr)
         {
            _loc4_.ser = getSerVoById(param1.nanduinfos,_loc4_.stc.id);
            if(_loc4_.ser.state == 2 && _loc4_.stc.locklevel <= PlayerModel.ins.level)
            {
               _loc2_ = _loc4_;
            }
         }
         if(!_loc2_)
         {
            var _loc9_:int = 0;
            var _loc8_:* = _bossArr;
            for each(_loc4_ in _bossArr)
            {
               if(_loc4_.ser.state != 3)
               {
                  _loc2_ = _loc4_;
               }
            }
         }
         this.list_boss.dataSource = _bossArr;
         if(_loc2_)
         {
            selectOneBoss(_loc2_);
            _listCtrl.goToSelectIndex(_bossArr.indexOf(_loc2_));
         }
         var _loc3_:int = _bossArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            if(_bossArr[_loc5_].ser.state == 1)
            {
               if(_loc5_ + 1 == _loc3_ || _bossArr[_loc5_ + 1].ser.state != 1)
               {
                  _bossArr[_loc5_].isLastTongguan = true;
               }
               else
               {
                  _bossArr[_loc5_].isLastTongguan = false;
               }
            }
            else
            {
               _bossArr[_loc5_].isLastTongguan = false;
            }
            _bossArr[_loc5_].nodeRes = _nodeRes;
            _loc5_++;
         }
      }
      
      private function selectOneBoss(param1:Object, param2:Boolean = true) : void
      {
         var _loc9_:int = 0;
         var _loc3_:* = null;
         var _loc5_:* = 0;
         var _loc8_:int = 0;
         _currSelectVo = param1;
         list_boss.selectedIndex = _bossArr.indexOf(_currSelectVo);
         this.desc.text = LocaleMgr.ins.getStr(param1.stc.desc);
         this.item_win.dataSource = WealthUtil.costStrToArr(param1.stc.winreward)[0];
         var _loc4_:Array = WealthUtil.costStrToArr(param1.stc.firstwin);
         _loc9_ = 0;
         while(_loc9_ < 2)
         {
            if(_loc4_.length >= _loc9_ + 1)
            {
               this["item_first" + _loc9_].visible = true;
               this["item_first" + _loc9_].dataSource = _loc4_[_loc9_];
            }
            else
            {
               this["item_first" + _loc9_].visible = false;
            }
            _loc9_++;
         }
         var _loc7_:HeroPracticeNanduInfo = param1.ser;
         if(_loc7_.state == 4 || _loc7_.state == 1)
         {
            item_first0.filters = FilterLib.ins.getFilterArr(402);
            item_first1.filters = FilterLib.ins.getFilterArr(402);
            this.img_get.visible = true;
         }
         else
         {
            this.img_get.visible = false;
            item_first0.filters = [];
            item_first1.filters = [];
         }
         var _loc6_:Boolean = false;
         if(_loc7_.state == 2 || _loc7_.state == 3)
         {
            this.txt_tips.text = LocaleMgr.ins.getStr(41400011);
            this.btn_buytimes.visible = false;
            this.saodang_btn.visible = false;
            this.fight_btn.centerX = 0;
            this.txt_tips.centerX = 0;
            this.txt_tips.y = 394;
            this.label_buy.visible = false;
            this.img_line2.y = 382;
            if(vipHintBox)
            {
               vipHintBox.visible = false;
            }
         }
         else
         {
            if(_nodeRes.shengyutimes > 0)
            {
               _loc3_ = "<font color=\'#00ff00\'>" + _nodeRes.shengyutimes + "</font>";
            }
            else
            {
               _loc6_ = true;
               _loc3_ = "<font color=\'#ff0000\'>" + _nodeRes.shengyutimes + "</font>";
            }
            this.txt_tips.text = LocaleMgr.ins.getStr(41400012) + _loc3_;
            if(this.btn_buytimes.visible == false && _taskAlertRender)
            {
               if(FloatBubbleUtil.needShow(1110))
               {
                  FloatBubbleUtil.addOneTime(1110.toString());
               }
               else
               {
                  _taskAlertRender.dispose();
                  _taskAlertRender = null;
               }
            }
            this.btn_buytimes.visible = true;
            this.saodang_btn.visible = true;
            this.fight_btn.centerX = NaN;
            this.fight_btn.x = 53;
            this.txt_tips.centerX = -60;
            this.txt_tips.y = 373;
            this.btn_buytimes.x = 168;
            this.btn_buytimes.y = 372;
            this.label_buy.visible = true;
            _loc5_ = uint(0);
            if(PlayerModel.ins.vip == 0)
            {
               this.label_buy.visible = false;
            }
            else
            {
               _loc8_ = int(VipModel.ins.getVipValue(10310)) - TimePriceUtil.curTimes(currTypeVo.type1);
               this.label_buy.text = LocaleMgr.ins.getStr(30100346,[LabelUtils.countNeedStr(_loc8_,int(VipModel.ins.getVipValue(10310)))]);
            }
            if(!vipHintBox)
            {
               vipHintBox = new VipHintBox(10310,RTools.cl(15,100),RTools.cl(417,397));
               DisplayUtils.addChildBelow(vipHintBox,this.btn_buytimes);
            }
            else
            {
               vipHintBox.visible = true;
            }
            label_buy.y = RTools.cl(397,374);
            label_buy.x = RTools.cl(55,205);
            txt_tips.centerX = RTools.cl(10,0);
            btn_buytimes.x = RTools.cl(300,168);
            this.img_line2.y = 396;
         }
         if(_loc6_ || _loc7_.state == 3)
         {
            this.btn_fight.disabled = true;
            this.btn_saodang.disabled = true;
            this.fight_btn.filters = FilterLib.ins.getFilterArr(402);
            this.saodang_btn.filters = FilterLib.ins.getFilterArr(402);
         }
         else
         {
            this.btn_fight.disabled = false;
            this.btn_saodang.disabled = false;
            this.fight_btn.filters = null;
            this.saodang_btn.filters = null;
         }
         _currSelectVo.canFight = !this.btn_fight.disabled;
         if(param2)
         {
            ObserverMgr.ins.sendNotice("RES_DG_SELECT_ONE_BOSS",_currSelectVo);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
