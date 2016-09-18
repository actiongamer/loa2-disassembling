package nslm2.modules.cultivates.skin.render
{
   import game.ui.skinModule.render.SkinListSubRenderUI;
   import nslm2.modules.cultivates.skin.SkinModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipTitleListPanelS5;
   import morn.core.components.Label;
   import nslm2.modules.footstones.tooltipsModules.uis.comps.TooltipGetPoinsDesc;
   import com.mz.core.event.MzEvent;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import com.mz.core.utils.FilterUtil;
   import game.ui.roleInfos.NpcPropVo;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import morn.core.components.Component;
   
   public class SkinListSubRender extends SkinListSubRenderUI
   {
       
      
      private var model:SkinModel;
      
      private var eff_backword:BmcSpriteSheet;
      
      private var panel:TooltipTitleListPanelS5;
      
      private var label:Label;
      
      private var panel2:TooltipGetPoinsDesc;
      
      public function SkinListSubRender()
      {
         model = SkinModel.ins;
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
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            model.addEventListener("evtActivateCpl",onActivateCpl);
         }
         else
         {
            model.removeEventListener("evtActivateCpl",onActivateCpl);
         }
      }
      
      private function onActivateCpl(param1:MzEvent) : void
      {
         if(dataSource)
         {
            if(param1.data == (dataSource as StcItemVo).id)
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
         var _loc1_:StcItemVo = dataSource as StcItemVo;
         this.txt_name.text = LocaleMgr.ins.getStr(_loc1_.name);
         this.skinRender.dataSource = WealthUtil.createItemVo(_loc1_.id);
         this.txt_desc.text = LocaleMgr.ins.getStr(_loc1_.desc).split("，")[0];
         if(model.isActive(_loc1_.id) || model.isUsed(_loc1_.id))
         {
            this.box_info.filters = null;
         }
         else
         {
            this.box_info.filters = [FilterUtil.grayFilter()];
         }
         this.txt_clickTips.visible = model.canActive(_loc1_.id);
         this.box_fight.txt_fightValue.value = model.getFightValue(_loc1_.id);
         if(!panel)
         {
            panel = new TooltipTitleListPanelS5(LocaleMgr.ins.getStr(999900506),NpcPropVo.parseItemVo(_loc1_));
            addVGap(10);
            panel.list_prop.x = 10;
            panel.list_prop.spaceX = 3;
            this.box.addChild(panel.list_prop);
         }
         else
         {
            panel.list_prop.dataSource = NpcPropVo.parseItemVo(_loc1_);
         }
         addVGap(10);
         if(!panel)
         {
            label = new Label(LocaleMgr.ins.getStr(999900507));
            label.x = 10;
            box.addChild(label);
         }
         addVGap(10);
         if(!panel2)
         {
            panel2 = new TooltipGetPoinsDesc(int(_loc1_.get_point_des));
            panel2.txt_getPointsDesc.x = 10;
            box.addChild(panel2.txt_getPointsDesc);
         }
      }
      
      protected function extend(param1:MouseEvent) : void
      {
         TweenLite.to(this.img_mask,1,{"height":327});
         TweenLite.to(this.img_bg,1,{"height":327});
         TweenLite.to(this.img_extend,1,{
            "y":294,
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
         img_extend.removeEventListener("click",back);
         img_extend.addEventListener("click",extend);
      }
      
      private function extendMode() : void
      {
         eff_backword.x = 123;
         eff_backword.y = -7;
         this.eff_backword.rotation = 90;
         img_extend.removeEventListener("click",extend);
         img_extend.addEventListener("click",back);
      }
      
      protected function back(param1:MouseEvent) : void
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
         super.dispose();
      }
   }
}
