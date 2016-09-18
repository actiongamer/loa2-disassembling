package nslm2.modules.dungeons.ctrls
{
   import nslm2.modules.dungeons.DungeonSceneModule;
   import morn.core.components.Button;
   import morn.core.components.Tab;
   import morn.core.components.Box;
   import com.mz.core.mediators.DragTargetMediator;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.utils.TransformUtil;
   import away3d.core.base.Object3D;
   import morn.core.components.VBox;
   import morn.core.components.HBox;
   
   public class DgDebugCtrl
   {
       
      
      public var dg:DungeonSceneModule;
      
      public var visbileBtn:Button;
      
      private var debugTab:Tab;
      
      public var debugBox:Box;
      
      private var debugBox0:Box;
      
      private var debugBox1:Box;
      
      private var debugBox2:Box;
      
      private var debugBox3:Box;
      
      private var debugBox4:Box;
      
      private var debugBox41:Box;
      
      private var debugBox42:Box;
      
      public function DgDebugCtrl(param1:DungeonSceneModule)
      {
         debugBox = new VBox();
         debugBox0 = new VBox();
         debugBox1 = new HBox();
         debugBox2 = new HBox();
         debugBox3 = new HBox();
         debugBox4 = new HBox();
         debugBox41 = new HBox();
         debugBox42 = new HBox();
         super();
         this.dg = param1;
         createDebug();
      }
      
      private function createDebug() : void
      {
         var _loc2_:* = null;
         var _loc1_:DragTargetMediator = new DragTargetMediator(this.debugBox,UIMgr.stage);
         _loc1_.useAlt = true;
         debugBox.parts.push(_loc1_);
         dg.addChild(debugBox);
         visbileBtn = new Button("png.comp.button","Visible");
         visbileBtn.x = 300;
         visbileBtn.addEventListener("click",visbileBtnHandler);
         debugBox.addChild(visbileBtn);
         debugBox.addChild(debugBox0);
         debugBox0.addChild(debugBox1);
         debugBox0.addChild(debugBox2);
         debugBox0.addChild(debugBox3);
         debugBox0.addChild(debugBox4);
         debugBox0.left = 30;
         debugBox0.top = 225;
         debugTab = new Tab(null,"png.comp.tab");
         debugTab.selectHandler = debugTab_selectHandler;
         debugTab.dataSource = [0,"1第二场","2播放","3-0","4-1","5-2","6-3","7"];
         debugBox2.addChild(debugTab);
         _loc2_ = new Object3DParams("root3D");
         _loc2_.commitMeasure();
         _loc2_.bind(UIMgr.root3D);
         debugBox1.addChild(_loc2_);
         _loc2_ = new Object3DParams("camera");
         _loc2_.commitMeasure();
         _loc2_.bind(AppGlobalContext.stage3d.view3d.camera);
         debugBox1.addChild(_loc2_);
      }
      
      private function visbileBtnHandler(... rest) : void
      {
         this.debugBox0.visible = !this.debugBox0.visible;
      }
      
      private function showAvatarDebugBox() : void
      {
         var _loc4_:int = 0;
         var _loc1_:* = null;
         var _loc3_:* = null;
         debugBox0.addChild(debugBox41);
         debugBox0.addChild(debugBox42);
         var _loc2_:int = dg.unitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = dg.unitViewHash.array[_loc4_];
            _loc3_ = new Object3DParams("$unitView" + _loc4_);
            _loc3_.bind(_loc1_.avatarBox);
            if(_loc4_ <= 2)
            {
               debugBox41.addChild(_loc3_);
            }
            else
            {
               debugBox42.addChild(_loc3_);
            }
            _loc4_++;
         }
         debugBox0.right = 0;
         debugBox0.top = 25;
      }
      
      private function debugTab_selectHandler(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               dg.validateBg();
               break;
            case 1:
               this.dg.cameraX = this.dg.dgVo.subSceneW;
               TransformUtil.cameraToBattlePerspective2(this.dg.cameraX);
               this.dg.validateBgBox(true);
               break;
            case 2:
               this.dg.cameraX = this.dg.dgVo.subSceneW;
               TransformUtil.cameraToBattlePerspective1(this.dg.cameraX);
               this.dg.validateBgBox(false);
               break;
            case 3:
               break;
            case 4:
               break;
            case 5:
               break;
            case 6:
         }
      }
      
      public function addDebugObject(param1:Object3D, param2:String, param3:int = 3) : void
      {
         var _loc4_:Object3DParams = new Object3DParams(param2);
         _loc4_.bind(param1);
         if(param3 == 3)
         {
            debugBox3.addChild(_loc4_);
         }
         else
         {
            debugBox4.addChild(_loc4_);
         }
      }
   }
}
