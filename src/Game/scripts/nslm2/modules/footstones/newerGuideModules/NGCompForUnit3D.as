package nslm2.modules.footstones.newerGuideModules
{
   import morn.core.components.Component;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Vector3D;
   import nslm2.utils.TransformUtil;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   
   public class NGCompForUnit3D extends Component implements INewerGuideCompResize
   {
       
      
      private var unit3d:Unit3DBase;
      
      private var parent2D:DisplayObjectContainer;
      
      private var uiPanel3D:Sprite;
      
      public function NGCompForUnit3D(param1:Unit3DBase, param2:DisplayObjectContainer, param3:int, param4:int, param5:UIPanel3D = null)
      {
         super();
         this.unit3d = param1;
         this.mouseEvent = false;
         this.visible = false;
         parent2D = param2;
         uiPanel3D = param5;
         param2.addChild(this);
         this.count(param3,param4);
      }
      
      public function count(param1:int, param2:int) : void
      {
         this.width = param1;
         this.height = param2;
         ngResize();
      }
      
      public function ngResize() : void
      {
         var _loc1_:* = null;
         if(uiPanel3D)
         {
            _loc1_ = new Vector3D(unit3d.pos2d.x + uiPanel3D.width / 2,-unit3d.pos2d.y + uiPanel3D.height / 2);
            this.x = _loc1_.x - this.width / 2;
            this.y = _loc1_.y - this.height;
         }
         else
         {
            _loc1_ = TransformUtil.stage3Dto2D(unit3d.position,parent2D);
            this.x = _loc1_.x - this.width / 2;
            this.y = _loc1_.y - this.height;
         }
      }
   }
}
