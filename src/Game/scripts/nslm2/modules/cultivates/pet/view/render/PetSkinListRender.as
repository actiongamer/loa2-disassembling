package nslm2.modules.cultivates.pet.view.render
{
   import game.ui.petModule.skin.PetSkinListRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   import morn.core.components.Label;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import com.mz.core.event.MzEvent;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.FilterUtil;
   import game.ui.roleInfos.NpcPropVo;
   import morn.core.components.Box;
   import com.greensock.TweenLite;
   import morn.core.components.Component;
   
   public class PetSkinListRender extends PetSkinListRenderUI implements IObserver
   {
       
      
      private var eff_backword:BmcSpriteSheet;
      
      private var model:PetModel;
      
      private var panel:TooltipTitleListPanelS5;
      
      private var panel2:TooltipGetPoinsDesc;
      
      private var label:Label;
      
      public function PetSkinListRender()
      {
         model = PetModel.ins;
         super();
         this.mask = img_mask;
         eff_backword = new BmcSpriteSheet();
         eff_backword.x = 80;
         eff_backword.y = 29;
         eff_backword.init(10800004,1,"all",true,1,0);
         eff_backword.rotation = -90;
         img_extend.addEventListener("click",extend);
         img_extend.addChild(eff_backword);
         switchEventListeners(true);
         ObserverMgr.ins.regObserver(this);
      }
      
      public function getFocusNotices() : Array
      {
         return ["extend_mode_cancel","evtFashionUsingChange"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("extend_mode_cancel" !== _loc3_)
         {
            if("evtFashionUsingChange" === _loc3_)
            {
               this.img_equiped.visible = model.isUsed((dataSource as StcPetStatusVo).id);
            }
         }
         else if((dataSource as StcPetStatusVo).id != param2 as int)
         {
            back();
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            model.addEventListener("evtActivateCpl",onActivateCpl);
            petRender.addEventListener("click",onClick);
         }
         else
         {
            model.removeEventListener("evtActivateCpl",onActivateCpl);
            petRender.removeEventListener("click",onClick);
         }
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("evtSkinSelect",new FashionEffectVO(petRender.img_icon,0,null,model.initStatus()));
      }
      
      private function onActivateCpl(param1:MzEvent) : void
      {
         if(dataSource)
         {
            if(param1.data == (dataSource as StcPetStatusVo).id)
            {
               refresh();
            }
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            .super.dataSource = param1;
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var _loc2_:StcPetStatusVo = dataSource as StcPetStatusVo;
         var _loc1_:StcItemVo = WealthUtil.costStrToVo(_loc2_.item).stcItemVo;
         this.txt_name.text = LocaleMgr.ins.getStr(_loc2_.id % _loc2_.node + 32000064);
         this.txt_desc.text = LocaleMgr.ins.getStr(_loc2_.id % _loc2_.node == 1?30200013:Number(32000067 + _loc2_.id % _loc2_.node)) + (_loc2_.id % _loc2_.node > 1?"\n" + LocaleMgr.ins.getStr(32000078 + _loc2_.id % _loc2_.node):"");
         this.img_equiped.visible = model.isUsed(_loc2_.id);
         if(_loc1_)
         {
            this.skinRender.visible = true;
            this.box_init.visible = false;
            this.skinRender.dataSource = WealthUtil.createItemVo(_loc1_.id);
            if(model.isActive(_loc2_.id) || model.isUsed(_loc2_.id))
            {
               this.box_info.filters = null;
               this.txt_desc.text = LocaleMgr.ins.getStr(30200013) + (_loc2_.id % _loc2_.node > 1?"\n" + LocaleMgr.ins.getStr(32000078 + _loc2_.id % _loc2_.node):"");
            }
            else
            {
               this.box_info.filters = [FilterUtil.grayFilter()];
            }
         }
         else
         {
            this.skinRender.visible = false;
            this.petRender.dataSource = model.crtPetInfoVo;
            this.petRender.getChildByName("selectBoxAll").visible = false;
            this.petRender.img_icon.smoothing = true;
            this.petRender.img_quality.smoothing = true;
            this.petRender.redPoint.visible = false;
            this.box_init.visible = true;
            this.petRender.img_using.visible = false;
            this.petRender.img_protect.visible = false;
            this.img_extend.visible = false;
         }
         if(!panel)
         {
            panel = new TooltipTitleListPanelS5("激活属性",NpcPropVo.parseArrStr(_loc2_.attr),PetSkinPropRender);
            panel.list_prop.repeatX = 1;
            panel.list_prop.repeatY = 6;
            panel.list_prop.x = 10;
            panel.list_prop.spaceX = 3;
            this.box.addChild(panel);
            panel.visible = false;
         }
         else
         {
            panel.list_prop.dataSource = NpcPropVo.parseArrStr(_loc2_.attr);
         }
         addVGap(10);
         if(!panel)
         {
            label = new Label("可激活");
            label.x = 10;
            box.addChild(label);
         }
      }
      
      protected function extend(param1:MouseEvent) : void
      {
         panel.visible = true;
         var _loc2_:Box = this.parent as Box;
         _loc2_.removeChild(this);
         _loc2_.addChild(this);
         ObserverMgr.ins.sendNotice("extend_mode_cancel",(this.dataSource as StcPetStatusVo).id);
         TweenLite.to(this.img_mask,1,{"height":237});
         TweenLite.to(this.img_bg,1,{"height":237});
         TweenLite.to(this.img_extend,1,{
            "y":204,
            "onComplete":extendMode
         });
         img_extend.removeEventListener("click",extend);
         img_extend.addEventListener("click",back);
      }
      
      private function initMode() : void
      {
         eff_backword.x = 80;
         eff_backword.y = 29;
         this.eff_backword.rotation = -90;
         panel.visible = false;
         img_extend.removeEventListener("click",back);
         img_extend.addEventListener("click",extend);
      }
      
      private function extendMode() : void
      {
         eff_backword.x = 183;
         eff_backword.y = -7;
         this.eff_backword.rotation = 90;
         img_extend.removeEventListener("click",extend);
         img_extend.addEventListener("click",back);
      }
      
      protected function back(param1:MouseEvent = null) : void
      {
         TweenLite.to(this.img_mask,1,{"height":117});
         TweenLite.to(this.img_bg,1,{"height":117});
         TweenLite.to(this.img_extend,1,{
            "y":83,
            "onComplete":initMode
         });
      }
      
      public function addVGap(param1:int = 12) : Component
      {
         var _loc2_:Component = new Component();
         _loc2_.height = param1;
         this.box.addChild(_loc2_);
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
