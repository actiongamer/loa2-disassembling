package nslm2.modules.scenes.commons
{
   import nslm2.utils.TransformUtil;
   import flash.geom.Point;
   import flash.events.Event;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.TextFieldUtil;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class SceneUnit3D extends Unit3DBase
   {
       
      
      public var side:int = -1;
      
      public function SceneUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.inUI = false;
         this.buttonMode = true;
         this.box3D2.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_3D / DefindConsts.SCENE_AVATAR_SCALE_SCENE;
      }
      
      override protected function validatePos() : void
      {
         this.position = TransformUtil.tran2DTo3D(this.pos2d.x,this.pos2d.y);
      }
      
      override protected function countRunPath(param1:int, param2:int) : Array
      {
         var _loc3_:Point = this.pos2d.clone();
         var _loc4_:Array = SceneModel.ins.findPathMed.getMovePath(_loc3_,new Point(param1,param2),false,side);
         return _loc4_;
      }
      
      override protected function avatar_mouseOver3D(param1:Event) : void
      {
         super.avatar_mouseOver3D(param1);
         if(this.tag3DVBox && this.tag3DVBox.nameTagStr)
         {
            ObserverMgr.ins.sendNotice("msg_tooltip_show",TextFieldUtil.htmlText2(this.tag3DVBox.nameTagStr,this.tag3DVBox.nameTagColor));
         }
      }
      
      override protected function avatar_mouseOut3D(param1:Event) : void
      {
         super.avatar_mouseOut3D(param1);
         if(this.tag3DVBox && this.tag3DVBox.nameTagStr)
         {
            ObserverMgr.ins.sendNotice("msg_tooltip_hide");
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
