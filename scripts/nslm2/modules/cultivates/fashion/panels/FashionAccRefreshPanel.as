package nslm2.modules.cultivates.fashion.panels
{
   import game.ui.fashionModules.panels.FashionAccRefreshPanelUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.cultivates.fashionAcc.model.FashionAccModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.FashionXiLianReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ProtocolStatusRes;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FashionMakeRes;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import proto.FashionList;
   import proto.FashionXiLianRes;
   import nslm2.utils.WealthUtil;
   
   public class FashionAccRefreshPanel extends FashionAccRefreshPanelUI implements IObserver, IViewStackPage
   {
       
      
      private var model:FashionAccModel;
      
      private var curAccLength:uint;
      
      public function FashionAccRefreshPanel()
      {
         model = FashionAccModel.ins;
         super();
         pieceRenderCenter.img_bg.visible = false;
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
      
      private function makeHandler() : void
      {
         var _loc1_:FashionXiLianReq = new FashionXiLianReq();
         _loc1_.targetId = model.curFashionAccId;
         ServerEngine.ins.send(6285,_loc1_,refreshCpl,resfreshErr);
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
         var _loc2_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         var _loc3_:StcFashionExtraSkillVo = StcMgr.ins.getFashionExtraSkillVo(_loc2_.skill);
         var _loc5_:StcSkillVo = StcMgr.ins.getSkillVo(_loc3_.skillId);
         this.txt_skillNum.text = LocaleMgr.ins.getStr(_loc5_.skill_description1,[param1.skillNum * (Math.abs(_loc3_.intRange) == 1?1:100) / Math.abs(_loc3_.intRange) + (Math.abs(_loc3_.intRange) == 1?"":"%")]);
         var _loc4_:FashionList = new FashionList();
         _loc4_.id = model.curFashionAccId;
         _loc4_.curUseId = false;
         _loc4_.skillNum = 0;
         FashionModel.ins.fashionAccArr.push(_loc4_);
      }
      
      private function refreshCpl(param1:FashionXiLianRes) : void
      {
         if(FashionModel.ins.fashionAccSkillDict.getValue(param1.skillId) == param1.skillNum)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210001));
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210002));
         }
         FashionModel.ins.fashionAccSkillDict.put(param1.skillId,param1.skillNum);
         var _loc2_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         var _loc3_:StcFashionExtraSkillVo = StcMgr.ins.getFashionExtraSkillVo(_loc2_.skill);
         var _loc4_:StcSkillVo = StcMgr.ins.getSkillVo(_loc3_.skillId);
         this.txt_skillNum.text = LocaleMgr.ins.getStr(_loc4_.skill_description1,[param1.skillNum * (Math.abs(_loc3_.intRange) == 1?1:100) / Math.abs(_loc3_.intRange) + (Math.abs(_loc3_.intRange) == 1?"":"%")]);
         this.list_cost.dataSource = WealthUtil.costStrToArr(_loc2_.xilianCost);
      }
      
      private function refresh() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:StcFashionSynVo = StcMgr.ins.getFashionSynVo(model.curFashionAccId);
         if(model.curFashionAccId)
         {
            this.list_cost.dataSource = WealthUtil.costStrToArr(_loc1_.xilianCost);
            _loc2_ = StcMgr.ins.getFashionExtraSkillVo(_loc1_.skill);
            _loc3_ = StcMgr.ins.getSkillVo(_loc2_.skillId);
            this.txt_skillNum.text = LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(StcMgr.ins.getFashionExtraSkillVo(_loc1_.skill).skillId).skill_description1,[int(FashionModel.ins.fashionAccSkillDict.getValue(model.curFashionAccId)) * (Math.abs(_loc2_.intRange) == 1?1:100) / Math.abs(_loc2_.intRange) + (Math.abs(_loc2_.intRange) == 1?"":"%")]);
            this.skillRender.dataSource = _loc2_.skillId;
            pieceRenderCenter.dataSource = WealthUtil.createItemVo(_loc1_.item);
            pieceRenderCenter.txt_countAndNeed.visible = false;
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
         if(model.curFashionAccId == 0 || BagModel.ins.getStcCount(_loc1_.item) <= 0)
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
         return ["refresh_acc","msg_item_num_change"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_item_num_change" !== _loc3_)
         {
            if("refresh_acc" !== _loc3_)
            {
            }
            addr16:
            return;
         }
         refresh();
         §§goto(addr16);
      }
   }
}
