package nslm2.modules.bag.equipComposes
{
   import game.ui.BagModules.equipComposes.EquipComposeSuccessUI;
   import nslm2.common.ctrls.TSMDict;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Image;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.uiEffects.IconFlyEff;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.common.ctrls.TSM;
   
   public class EquipComposeSuccess extends EquipComposeSuccessUI
   {
       
      
      private var tsms:TSMDict;
      
      public function EquipComposeSuccess()
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
         if(isDisposed)
         {
            return;
         }
         this.mouseEvent = true;
         this.render.visible = true;
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.init(1015007,1,"all",true);
         _loc1_.y = this.render.y - 100 + 20;
         _loc1_.x = this.render.x - 95 + 24;
         if(render)
         {
            DisplayUtils.addChildBelow(_loc1_,this.render);
         }
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
         tsms.toState(404);
         this.render.visible = false;
         ModuleMgr.ins.closeModule(ModuleMgr.ins.popLayer.curModuleId);
         IconFlyEff.createFlyToBag(this.render.img_icon).addHandlers(flyOutCpl).exec();
      }
      
      private function flyOutCpl(param1:IconFlyEff) : void
      {
         ObserverMgr.ins.sendNotice("MSG_EQUIP_COMPOSE_SUCCESS");
         this.visible = false;
      }
      
      override public function dispose() : void
      {
         tsms.clear();
         tsms = null;
         removeEventListener("click",onClick);
         super.dispose();
      }
   }
}
