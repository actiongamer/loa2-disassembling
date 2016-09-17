package nslm2.modules.scenes.commons
{
   import nslm2.modules.scenes.ctrls.Effect3DEmmiterCtrl;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import morn.core.utils.StringUtils;
   import nslm2.mgrs.MouseIconManager;
   import flash.events.Event;
   import away3d.containers.ObjectContainer3D;
   
   public class SceneNpc3D extends SceneUnit3D
   {
       
      
      public var npcGroupId:int;
      
      public var showFightCursor:Boolean = false;
      
      private var emCtrl:Effect3DEmmiterCtrl;
      
      public function SceneNpc3D(param1:ObjectContainer3D)
      {
         super(param1);
         this.overMethodEnabled = true;
         this.overMethodColor = 12798193;
         this.mousePriority = 4;
      }
      
      override protected function getEffCpl() : void
      {
         if(this.isDispose)
         {
            return;
         }
         super.getEffCpl();
         var _loc1_:StcSpecialEffectVo = StcMgr.ins.getSpecialEffectVo(int(this.effId));
         if(!StringUtils.isNull(_loc1_.emmiter_names))
         {
            emCtrl = new Effect3DEmmiterCtrl(this.eff3dAvatar,_loc1_.emmiter_names.split(","));
            emCtrl.hideAll();
         }
      }
      
      override protected function setMouseCursorOver() : void
      {
         if(showFightCursor)
         {
            MouseIconManager.ins.addMouseFor3D(this);
            MouseIconManager.ins.showSpecialMouseCursor("mouse_fight_big");
         }
         else
         {
            super.setMouseCursorOver();
         }
      }
      
      override protected function avatar_mouseOver3D(param1:Event) : void
      {
         super.avatar_mouseOver3D(param1);
         if(emCtrl)
         {
            emCtrl.showAll(0.3);
         }
      }
      
      override protected function avatar_mouseOut3D(param1:Event) : void
      {
         super.avatar_mouseOut3D(param1);
         if(emCtrl)
         {
            emCtrl.hideAll(0.9);
         }
      }
      
      override protected function avatar_mouseDown3D(param1:Event) : void
      {
         super.avatar_mouseDown3D(param1);
      }
      
      override public function dispose() : void
      {
         if(emCtrl != null)
         {
            emCtrl.dispose();
            emCtrl = null;
         }
         super.dispose();
      }
   }
}
