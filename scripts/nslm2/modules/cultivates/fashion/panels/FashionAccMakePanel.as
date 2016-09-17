package nslm2.modules.cultivates.fashion.panels
{
   import game.ui.fashionModules.panels.FashionAccMakePanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.fashionAcc.model.FashionAccModel;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.common.vo.WealthVo;
   import proto.FashionMakeReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FashionMakeRes;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import proto.FashionList;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.modules.cultivates.fashionAcc.render.FashionAccMaterialRender;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   
   public class FashionAccMakePanel extends FashionAccMakePanelUI implements IViewStackPage, IObserver
   {
       
      
      private var model:FashionAccModel;
      
      private var curAccLength:uint;
      
      public function FashionAccMakePanel()
      {
         model = FashionAccModel.ins;
         super();
         this.pieceRender0.buttonMode = true;
         this.pieceRender1.buttonMode = true;
         this.pieceRender0.addEventListener("click",render1Handler);
         this.pieceRender1.addEventListener("click",render2Handler);
         this.btn_make.clickHandler = makeHandler;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         refresh();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      protected function render1Handler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(pieceRender0.dataSource as WealthVo),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      protected function render2Handler(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(pieceRender1.dataSource as WealthVo),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function makeHandler() : void
      {
         var _loc1_:FashionMakeReq = new FashionMakeReq();
         _loc1_.targetId = model.curFashionAccId;
         ServerEngine.ins.send(6284,_loc1_,makeCpl,makeErr);
      }
      
      private function makeErr(param1:ProtocolStatusRes) : void
      {
         if(param1.errCode == 300004024)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31200009));
         }
         else
         {
            ServerEngine.ins.doDefaultErr(param1);
         }
      }
      
      private function resfreshErr(param1:ProtocolStatusRes) : *
      {
         if(param1.errCode == 300006090)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210003));
         }
      }
      
      private function makeCpl(param1:FashionMakeRes) : void
      {
         curAccLength = BagModel.ins.getFashionAccArr(0).length;
         FashionModel.ins.fashionAccSkillDict.put(param1.skillId,param1.skillNum);
         var _loc2_:FashionList = new FashionList();
         _loc2_.id = model.curFashionAccId;
         _loc2_.curUseId = false;
         _loc2_.skillNum = 0;
         FashionModel.ins.fashionAccArr.push(_loc2_);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(31220,true));
      }
      
      private function refresh() : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         if(model.curFashionAccId)
         {
            _loc4_ = 0;
            while(_loc4_ < 2)
            {
               if(this.hasOwnProperty("pieceRender" + _loc4_))
               {
                  (this["pieceRender" + _loc4_] as FashionAccMaterialRender).dataSource = WealthUtil.costStrToVo(_loc1_.costItem.split("|")[_loc4_]);
               }
               _loc4_++;
            }
            this.costRender.visible = true;
            this.costRender.dataSource = WealthUtil.costStrToVo(_loc1_.extraCost);
            _loc2_ = StcMgr.ins.getFashionExtraSkillVo(_loc1_.skill);
            _loc3_ = StcMgr.ins.getSkillVo(_loc2_.skillId);
            this.txt_skillNum.text = LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(StcMgr.ins.getFashionExtraSkillVo(_loc1_.skill).skillId).skill_description1,[int(FashionModel.ins.fashionAccSkillDict.getValue(model.curFashionAccId)) * (Math.abs(_loc2_.intRange) == 1?1:100) / Math.abs(_loc2_.intRange) + (Math.abs(_loc2_.intRange) == 1?"":"%")]);
            this.skillRender.dataSource = _loc2_.skillId;
         }
         checkCanMake();
      }
      
      private function skillEffCpl() : void
      {
         refresh();
      }
      
      private function checkCanMake() : void
      {
         var _loc1_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         if(model.curFashionAccId == 0 || BagModel.ins.getStcCount(_loc1_.item) > 0)
         {
            this.btn_make.disabled = true;
         }
         else
         {
            this.btn_make.disabled = false;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["refresh_acc","acc_make_cpl","msg_item_num_change"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc6_:* = param1;
         if("msg_item_num_change" !== _loc6_)
         {
            if("refresh_acc" !== _loc6_)
            {
               if("acc_make_cpl" === _loc6_)
               {
                  if(model.curFashionAccId)
                  {
                     _loc3_ = WealthUtil.createItemVo(StcMgr.ins.getFashionSynVo(model.curFashionAccId).item);
                     FloatUtil.showGetItemsDisplayPanel([_loc3_]);
                     _loc6_ = 0;
                     var _loc5_:* = NpcPropVo.parseArrStr(StcMgr.ins.getFashionSynVo(model.curFashionAccId).prop);
                     for each(var _loc4_ in NpcPropVo.parseArrStr(StcMgr.ins.getFashionSynVo(model.curFashionAccId).prop))
                     {
                        AlertUtil.showPropChangeTip(NPCPropConsts.ins.getLocaleNameNormal(_loc4_.propId),_loc4_.value,null,null,DisplayUtils.globarCenter(this).add(new Point(0,-50)));
                     }
                     refresh();
                  }
               }
            }
            addr81:
            return;
         }
         refresh();
         §§goto(addr81);
      }
   }
}
