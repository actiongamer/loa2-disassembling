package nslm2.modules.cultivates.militaryInfos.render
{
   import game.ui.militaryRankInfos.render.MilitaryRenderUI;
   import nslm2.common.compsEffects.ImgHeartEffect;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.cultivates.militaryInfos.MilitaryService;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.event.MzEvent;
   import nslm2.common.model.PlayerModel;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcMilitaryrankVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.utils.WealthUtil;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.FilterUtil;
   import com.mz.core.mediators.RollMediator;
   
   public class MilitaryRender extends MilitaryRenderUI
   {
       
      
      private var _heartEffect:ImgHeartEffect;
      
      private var _initY:Number;
      
      public function MilitaryRender()
      {
         super();
         switchEventListener(true);
         this.parts.push(new RollMediator(this.img_bg,onRoll));
         _initY = this.box_floatIcon.y;
      }
      
      private function get model() : MilitaryModel
      {
         return MilitaryModel.ins;
      }
      
      private function get service() : MilitaryService
      {
         return MilitaryService.ins;
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(param1)
         {
            TweenLite.to(this.box_floatIcon,0.2,{"y":_initY - 10});
            if(MilitaryModel.ins.hasUpgraded(this.vo.id) == false)
            {
               ObserverMgr.ins.sendNotice("evtMilitaryRollIn",this.vo);
            }
         }
         else
         {
            TweenLite.to(this.box_floatIcon,0.2,{"y":_initY});
            ObserverMgr.ins.sendNotice("evtMilitaryRollOut");
         }
      }
      
      private function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            service.addEventListener("evtUpgradeCpl",onUpgradeCpl);
            this.addEventListener("click",onClick);
         }
         else
         {
            service.removeEventListener("evtUpgradeCpl",onUpgradeCpl);
            this.removeEventListener("click",onClick);
         }
      }
      
      private function onUpgradeCpl(param1:MzEvent) : void
      {
         if(_heartEffect)
         {
            _heartEffect.dispose();
            _heartEffect = null;
         }
         if(PlayerModel.ins.playerInfo.militaryrank == this.vo.id)
         {
            this.txt_addProp.visible = false;
            this.txt_cond.visible = false;
            this.mouseEvent = true;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(model.getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank) == this.vo.id)
         {
            if(model.canUpgrade(this.vo.id))
            {
               this.mouseEvent = false;
               service.upgrade();
            }
            else
            {
               ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealthVo(WealthVo.parseCostStr(this.vo.cond)),ModuleMgr.ins.popLayer.curModuleId);
            }
         }
         else if(model.hasUpgraded(this.vo.id) == false)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30400006));
         }
      }
      
      private function get vo() : StcMilitaryrankVo
      {
         return dataSource as StcMilitaryrankVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            this.txt_name.text = LocaleMgr.ins.getStr(vo.name);
            this.img_icon.url = UrlLib.militaryIcon(this.vo.id);
            this.toolTip = this.vo;
            this.render_cost.dataSource = WealthUtil.parseCostStr(this.vo.cond);
            if(this.vo.kind == 1)
            {
               _loc2_ = NpcPropVo.filterZeroProp(model.getAddPropSingle(vo.id))[0];
               this.txt_addProp.text = TextFieldUtil.htmlText2(NPCPropConsts.ins.getLocaleNameNormal(_loc2_.propId) + "+" + _loc2_.value,458496);
            }
            else
            {
               this.txt_addProp.text = LocaleMgr.ins.getStr(30400000,[LocaleMgr.ins.getStr(6000 + int(this.vo.prop))]);
            }
            validate();
         }
      }
      
      private function validate() : void
      {
         if(model.getNextMilitaryId(PlayerModel.ins.playerInfo.militaryrank) == this.vo.id)
         {
            if(model.canUpgrade(this.vo.id))
            {
               _heartEffect = new ImgHeartEffect(this.img_icon);
               this.box_cond.visible = false;
               this.txt_cond.text = LocaleMgr.ins.getStr(30400008);
               this.txt_cond.visible = true;
            }
            else
            {
               if(_heartEffect)
               {
                  _heartEffect.dispose();
                  _heartEffect = null;
               }
               this.box_cond.visible = true;
               this.txt_cond.visible = false;
            }
            this.box_icon.filters = [FilterUtil.grayFilter()];
         }
         else
         {
            if(_heartEffect)
            {
               _heartEffect.dispose();
               _heartEffect = null;
            }
            if(model.hasUpgraded(this.vo.id))
            {
               this.box_icon.filters = null;
               this.txt_addProp.visible = false;
               this.box_cond.visible = false;
            }
            else
            {
               this.box_cond.visible = true;
               this.box_icon.filters = [FilterUtil.grayFilter()];
               this.txt_addProp.visible = true;
            }
            this.txt_cond.visible = false;
         }
      }
      
      override public function dispose() : void
      {
         if(_heartEffect)
         {
            _heartEffect.dispose();
            _heartEffect = null;
         }
         switchEventListener(false);
         super.dispose();
      }
   }
}
