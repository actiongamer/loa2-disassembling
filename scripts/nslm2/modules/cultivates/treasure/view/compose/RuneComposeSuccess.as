package nslm2.modules.cultivates.treasure.view.compose
{
   import game.ui.BagModules.equipComposes.EquipComposeSuccessUI;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Image;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.uiEffects.IconFlyEff;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.ctrls.TSM;
   
   public class RuneComposeSuccess extends EquipComposeSuccessUI
   {
       
      
      private var tsms:TSMDict;
      
      public function RuneComposeSuccess()
      {
         tsms = new TSMDict();
         super();
         this.visible = false;
         this.centerX = 0;
         this.centerY = 0;
         tsms.put(this.box_bg,new TSM(this.box_bg,0.4).addState(404,{"alpha":0}));
         tsms.put(this.img_cover,new TSM(this.img_cover,0.4).addState(404,{"alpha":0}));
         tsms.toState(404,0);
      }
      
      public function show(param1:WealthVo, param2:Image) : void
      {
         this.visible = true;
         this.render.visible = false;
         this.render.wealthVo = param1;
         var _loc3_:NpcPropVo = NPCPropConsts.ins.getEquipProp(param1.sid);
         if(_loc3_)
         {
            this.txt_prompt.text = LocaleMgr.ins.getStr(1000 + _loc3_.propId) + " +" + int(_loc3_.value);
         }
         else
         {
            this.txt_prompt.text = "";
         }
         new IconFlyEff(IconFlyEff.copyImage(param2),param2,this.render.img_icon).addHandlers(flyCpl).exec();
      }
      
      protected function flyCpl() : void
      {
         this.mouseEvent = true;
         this.render.visible = true;
         tsms.toState(0);
         this.addEventListener("click",onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         this.mouseEvent = false;
         this.render.visible = false;
         tsms.toState(404);
         ObserverMgr.ins.sendNotice("treasure_update_rune_data");
         var _loc1_:Array = TreasureModel.ins.getRunePositon(this.render.wealthVo.sid);
         IconFlyEff.createFlyTo(this.render.img_icon,_loc1_[0]).set_scaleTo(1.4).exec();
         flyOutCpl(null);
      }
      
      private function flyOutCpl(param1:IconFlyEff) : void
      {
         ModuleMgr.ins.closeModule(ModuleMgr.ins.popLayer.curModuleId);
         this.visible = false;
      }
   }
}
