package nslm2.modules.scenes.ctrls
{
   import morn.core.components.VBox;
   import morn.core.components.Tab;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import nslm2.common.ui.components.debug3d.Param3DRender;
   import com.mz.core.mediators.DragMediator;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import com.mz.core.logging.Log;
   
   public class MainCityDebugCtrl extends SceneCtrlBase
   {
       
      
      public var debugBox:VBox;
      
      private var debugTab:Tab;
      
      public var o3d:Object3DParams;
      
      public var o3d1:Object3DParams;
      
      public var o3d2:Object3DParams;
      
      public var paramX:Param3DRender;
      
      public var paramY:Param3DRender;
      
      private var drag:DragMediator;
      
      public function MainCityDebugCtrl()
      {
         debugBox = new VBox();
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.drag = new DragMediator(this.debugBox,UIMgr.stage);
         drag.useAlt = true;
         drag.addEventListener("valueChange",onValueChange);
         debugBox.centerY = 0;
         scene.addChild(debugBox);
         o3d = new Object3DParams("bgAllLayer");
         debugBox.addChild(new Object3DParams("bgAllLayer"));
         o3d.bind(scene.multiBgLayer.bgAllLayer);
         o3d = new Object3DParams("camera3d");
         debugBox.addChild(new Object3DParams("camera3d"));
         o3d.bind(scene.camera3d);
         o3d2 = new Object3DParams("playerHero");
         debugBox.addChild(new Object3DParams("playerHero"));
         o3d2.bind(scene.playerHero.box3D);
         paramX = new Param3DRender();
         paramX.paramType = "position";
         paramX.bind(scene.multiBgLayer.mainLayer.tileImg,"repeatStartX");
         debugBox.addChild(paramX);
         paramY = new Param3DRender();
         paramY.paramType = "position";
         paramY.bind(scene.multiBgLayer.mainLayer.tileImg,"repeatStartY");
         debugBox.addChild(paramY);
         debugTab = new Tab(null,"png.comp.tab");
         debugTab.selectHandler = debugTab_selectHandler;
         debugTab.dataSource = [0,"1主角位置","2","3","4","5","6","7"];
         debugBox.addChild(debugTab);
      }
      
      private function onValueChange(param1:Event) : void
      {
         debugBox.x = debugBox.x + this.drag.changeX;
         debugBox.y = debugBox.y + this.drag.changeY;
      }
      
      private function debugTab_selectHandler(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
            case 1:
               Log.debug(this,"player.pos2d: ",scene.playerHero.pos2d);
            case 2:
            case 3:
               scene.multiBgLayer.visible = !scene.multiBgLayer.visible;
               return;
            case 4:
               scene.playerHero.avatar.setRotation(315,true);
               return;
            case 5:
               scene.playerHero.avatar.setRotation(45,true);
            case 6:
               scene.playerHero.avatar.setRotation(180,true);
            case 7:
               scene.camera3d.x = -1000;
               scene.camera3d.y = 0;
               scene.camera3d.z = 0;
               scene.camera3d.rotationX = 0;
               scene.camera3d.rotationY = 90;
               scene.camera3d.rotationZ = 0;
               return;
            case 8:
               scene.playerHero.avatar.setRotation(270,true);
            case 9:
               scene.playerHero.avatar.setRotation(315,true);
            case 10:
               scene.playerHero.avatar.setRotation(360);
         }
      }
   }
}
