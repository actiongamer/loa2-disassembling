package nslm2.modules.funnies.dials.panels
{
   import game.ui.dialModule.panels.DialVipPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ctrls.DialCtrl;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.dials.model.DialModel;
   import nslm2.modules.funnies.dials.msgs.DialMsgs;
   import com.mz.core.event.MzEvent;
   import proto.ZhuanPanSuperRes;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.ArrayUtil;
   import proto.StaticZhuanPanItemModel;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.funnies.dials.renders.DialCostRender;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Button;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.dials.service.DialService;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import morn.customs.expands.MornExpandUtil;
   
   public class DialVipPanel extends DialVipPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var _dialCtrl:DialCtrl;
      
      private var _onceRedPoint:RedPoint;
      
      private var _tenthRedPoint:RedPoint;
      
      private var _res:ZhuanPanSuperRes;
      
      private var _itemArr:Array;
      
      private var _bmcSpriteSheet:BmcSpriteSheet;
      
      public function DialVipPanel()
      {
         _itemArr = [];
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         _dialCtrl = new DialCtrl(this.box_arrow);
         this.parts.push(new DialCtrl(this.box_arrow));
         _dialCtrl.split(12);
         _onceRedPoint = new RedPoint();
         _onceRedPoint.right = -2;
         _onceRedPoint.top = -2;
         this.btn_one.addChild(_onceRedPoint);
         _tenthRedPoint = new RedPoint();
         _tenthRedPoint.right = -2;
         _tenthRedPoint.top = -2;
         this.btn_ten.addChild(_tenthRedPoint);
         initLanguage();
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(61000000,1,"all",true);
         _loc1_.x = 346;
         _loc1_.y = 216;
         this.addChild(_loc1_);
      }
      
      private function initLanguage() : void
      {
         this.btn_one.label = LocaleMgr.ins.getStr(60800009);
         this.btn_ten.label = LocaleMgr.ins.getStr(60800010);
         this.txt_60800028.text = LocaleMgr.ins.getStr(60800028);
      }
      
      private function get kind() : int
      {
         return 2;
      }
      
      public function viewStackIn() : void
      {
         switchEventListeners(true);
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         this.mouseEvent = DialModel.ins.isDialOpen();
         this.txt_time.text = DialModel.ins.getDialTimeStr();
         refresh();
      }
      
      public function viewStackOut() : void
      {
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            DialMsgs.ins.addEventListener("super_dial_cpl",onSuperDialCpl);
            DialMsgs.ins.addEventListener("switch_mouse_event",onChangeMouseEvent);
         }
         else
         {
            DialMsgs.ins.removeEventListener("super_dial_cpl",onSuperDialCpl);
            DialMsgs.ins.removeEventListener("switch_mouse_event",onChangeMouseEvent);
         }
      }
      
      private function onChangeMouseEvent(param1:MzEvent) : void
      {
         this.mouseEvent = param1.data;
      }
      
      private function onSuperDialCpl(param1:MzEvent) : void
      {
         _res = param1.data as ZhuanPanSuperRes;
         doEffect(0);
      }
      
      private function doEffect(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         switch(int(param1))
         {
            case 0:
               showOrHideEffect(true);
               _loc3_ = 0;
               _loc2_ = 0;
               trace("=========>",_res.itemids.join("++"));
               if(_res.itemids.length > 0)
               {
                  _dialCtrl.toRotation(0,new Handler(doEffect,[1]));
               }
               else
               {
                  _dialCtrl.toIndex(ArrayUtil.indexByAttr(_itemArr,StaticZhuanPanItemModel.ID.name,_res.itemid),new Handler(doEffect,[1]));
               }
               break;
            case 1:
               FloatUtil.showGetItemsDisplayPanel(WealthUtil.rewardArrToWealthVoArr(_res.rewards));
               DialMsgs.ins.dispatchEvent(new MzEvent("switch_mouse_event",true));
               DialMsgs.ins.dispatchEvent(new MzEvent("effect_cpl"));
               showOrHideEffect(false);
         }
      }
      
      private function refresh() : void
      {
         _itemArr = DialModel.ins.getItemArrByKind(kind);
         this.list_item.dataSource = _itemArr;
         (this.render_costOne as DialCostRender).costModel = DialModel.ins.getCostByKind(kind,false);
         (this.render_costTen as DialCostRender).costModel = DialModel.ins.getCostByKind(kind,true);
         refreshRedPoint();
      }
      
      private function showOrHideEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(_bmcSpriteSheet == null)
            {
               _bmcSpriteSheet = new BmcSpriteSheet();
               _bmcSpriteSheet.init(61000002,1,"all",true);
               _bmcSpriteSheet.x = 348;
               _bmcSpriteSheet.y = 216;
               DisplayUtils.addChildBelow(_bmcSpriteSheet,box_arrow);
            }
         }
         else if(_bmcSpriteSheet)
         {
            _bmcSpriteSheet.dispose();
            _bmcSpriteSheet = null;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if(this.btn_one !== _loc4_)
         {
            if(this.btn_one2 !== _loc4_)
            {
               if(this.btn_ten === _loc4_)
               {
                  if(PlayerModel.ins.vip < 4)
                  {
                     AlertUtil.lackVipLevel(4);
                     return;
                  }
                  _loc2_ = this.render_costTen.wealthVo.count;
                  _loc3_ = PlayerModel.ins.getCountByWealthVo(this.render_costTen.wealthVo);
                  if(_loc3_ >= _loc2_)
                  {
                     if(DialModel.ins.canUseItemDial(kind,true))
                     {
                        DialService.ins.doSuperDial(true);
                     }
                     else
                     {
                        AlertUtil.comfirm(LocaleMgr.ins.getStr(60800042,[this.render_costTen.wealthVo.count]),new Handler(DialService.ins.doSuperDial,[true]),null,"60800" + kind);
                     }
                  }
                  else if(render_costOne.wealthVo.kind == 20)
                  {
                     ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(render_costOne.wealthVo.kind,render_costOne.wealthVo.stcItemVo.id),ModuleMgr.ins.popLayer.curModuleId);
                  }
                  else
                  {
                     AlertUtil.showRechargeAlert();
                  }
               }
            }
            addr183:
            return;
         }
         if(PlayerModel.ins.vip < 4)
         {
            AlertUtil.lackVipLevel(4);
            return;
         }
         _loc2_ = this.render_costOne.wealthVo.count;
         _loc3_ = PlayerModel.ins.getCountByWealthVo(this.render_costOne.wealthVo);
         if(_loc3_ >= _loc2_)
         {
            if(DialModel.ins.canUseItemDial(kind,false))
            {
               DialService.ins.doSuperDial(false);
            }
            else
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(60800042,[this.render_costOne.wealthVo.count]),new Handler(DialService.ins.doSuperDial,[false]),null,"60800" + kind);
            }
         }
         else if(this.render_costOne.wealthVo.kind == 9)
         {
            AlertUtil.lackGoldenDiamond();
         }
         else
         {
            AlertUtil.showRechargeAlert();
         }
         §§goto(addr183);
      }
      
      private function refreshRedPoint() : void
      {
         _onceRedPoint.visible = DialModel.ins.canUseItemDial(kind,false);
         _tenthRedPoint.visible = DialModel.ins.canUseItemDial(kind,true);
         if(DialModel.TYPE == 60800)
         {
            btn_one.toolTip = LocaleMgr.ins.getStr(60800040,[this.render_costOne.wealthVo.count + this.render_costOne.wealthVo.showName,10,10]);
            btn_one2.toolTip = LocaleMgr.ins.getStr(60800040,[this.render_costOne.wealthVo.count + this.render_costOne.wealthVo.showName,10,10]);
            btn_ten.toolTip = LocaleMgr.ins.getStr(60800040,[this.render_costTen.wealthVo.count + this.render_costTen.wealthVo.showName,100,100]);
         }
         else
         {
            btn_one.toolTip = LocaleMgr.ins.getStr(60800040,[this.render_costOne.wealthVo.count + this.render_costOne.wealthVo.showName,DialModel.getIns(60810).msg_1_0,DialModel.getIns(60810).msg_1_1]);
            btn_one2.toolTip = LocaleMgr.ins.getStr(60800040,[this.render_costOne.wealthVo.count + this.render_costOne.wealthVo.showName,DialModel.getIns(60810).msg_1_0,DialModel.getIns(60810).msg_1_1]);
            btn_ten.toolTip = LocaleMgr.ins.getStr(60800040,[this.render_costTen.wealthVo.count + this.render_costTen.wealthVo.showName,int(DialModel.getIns(60810).msg_1_0) * 10,int(DialModel.getIns(60810).msg_1_1) * 10]);
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 60800)
            {
               refreshRedPoint();
            }
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_MODULE_REN_POINT"];
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
