package nslm2.modules.fightPlayer
{
   import morn.customs.components.SceneModuleView;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.containers.ObjectContainer3D;
   import nslm2.modules.test.UVAnimateCtrl;
   import nslm2.modules.test.AutoRotationCtrl;
   import away3d.cameras.Camera3D;
   import away3d.containers.Scene3D;
   import away3d.containers.View3D;
   import com.mz.core.mgrs.UIMgr;
   import away3d.cameras.lenses.PerspectiveLens;
   import away3d.cameras.lenses.OrthographicLens;
   import flash.geom.Vector3D;
   import away3d.entities.Mesh;
   import away3d.primitives.PlaneGeometry;
   import nslm2.modules.test.LightEffectCtrl;
   import morn.core.components.VBox;
   import morn.core.components.HSlider;
   import nslm2.common.ui.components.debug3d.Object3DParams;
   import morn.core.components.Tab;
   import morn.core.components.HBox;
   import morn.core.components.Button;
   import com.mz.core.mgrs.resMgrs.GetResEffect3DTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.utils.TransformUtil;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import org.specter3d.loaders.AssetLib;
   import away3d.textures.BitmapTexture;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl2;
   import com.mz.core.utils2.ShakeUtil;
   import flash.geom.Point;
   import com.greensock.TweenLite;
   import org.specter3d.display.particle.EffectManager;
   import flash.events.Event;
   import com.mz.core.utils.DictHash;
   
   public class TestScene3DModule7 extends SceneModuleView
   {
       
      
      private var bgBlur1:Image3D;
      
      private var bgFake2D:Image3D;
      
      private var bg2D:Image3D;
      
      private var bgFake3D:Image3D;
      
      private var bg3D:Image3D;
      
      private var bgBlur2:Image3D;
      
      private var bgBox:ObjectContainer3D;
      
      private var bgBoxCamear:ObjectContainer3D;
      
      private var floor:Image3D;
      
      private var uvAnimateCtrl:UVAnimateCtrl;
      
      private var uvAnimateCtrlB:UVAnimateCtrl;
      
      private var autoRotationFloor:AutoRotationCtrl;
      
      private var unitVoArr:Array;
      
      private var _isRender:Boolean = true;
      
      private var _debugAxesVisible:Boolean;
      
      private var _camera3d:Camera3D;
      
      private var _scene3d:Scene3D;
      
      private var _view3d:View3D;
      
      private var rootLayer:ObjectContainer3D;
      
      private var unitLayer:ObjectContainer3D;
      
      private var effLayer:ObjectContainer3D;
      
      private var bgUrl:String;
      
      private var bossInitX:int = 1500;
      
      private var eff:SpecterEffect;
      
      private var o3dArr:Vector.<Object3DParams>;
      
      private var bossScaleP:Number = 9;
      
      public var lightCtrl:LightAndShadowCtrl2;
      
      private var bossActioning:Boolean = false;
      
      private var skillIndex:int = 0;
      
      private var old:Object;
      
      private var perspectiveLens:PerspectiveLens;
      
      private var orthographicLens:OrthographicLens;
      
      private var unitViewHash:DictHash;
      
      private var vBox0:VBox;
      
      private var slider:HSlider;
      
      private var sliderOffsetU:HSlider;
      
      private var sliderOffsetV:HSlider;
      
      private var sliderScaleU:HSlider;
      
      private var sliderScaleV:HSlider;
      
      private var boss:nslm2.modules.fightPlayer.UnitView;
      
      private var vBoxUnitArr:VBox;
      
      private var hBoxUnitArr1:HBox;
      
      private var hBoxUnitArr2:HBox;
      
      private var btnZoomIn:Button;
      
      private var btnLookAt:Button;
      
      private var btnZoomOut:Button;
      
      private var lightEffectCtrl:LightEffectCtrl;
      
      private var _alpha:Number = 1;
      
      public function TestScene3DModule7()
      {
         rootLayer = new ObjectContainer3D();
         unitLayer = new ObjectContainer3D();
         effLayer = new ObjectContainer3D();
         o3dArr = new Vector.<Object3DParams>();
         old = {};
         super();
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc10_:int = 0;
         var _loc7_:* = null;
         var _loc2_:* = null;
         super.show(param1);
         unitVoArr = param1 as Array;
         var _loc11_:int = 0;
         UIMgr.spriteFor3D.y = _loc11_;
         UIMgr.spriteFor3D.x = _loc11_;
         var _loc9_:int = unitVoArr.length;
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            _loc7_ = unitVoArr[_loc10_];
            _loc7_.init();
            _loc10_++;
         }
         _view3d = new View3D();
         _view3d.antiAlias = 4;
         _view3d.mouseChildren = false;
         _view3d.width = 1500;
         _view3d.height = 900;
         _view3d.backgroundAlpha = 0;
         UIMgr.spriteFor3D.addChild(_view3d);
         _view3d.stage3DProxy.width = 0;
         _view3d.stage3DProxy.height = 0;
         _scene3d = _view3d.scene;
         _camera3d = _view3d.camera;
         perspectiveLens = new PerspectiveLens(60);
         _camera3d.lens = new PerspectiveLens(60);
         perspectiveLens.far = 8000;
         orthographicLens = new OrthographicLens(_view3d.height);
         _camera3d.lens = new OrthographicLens(_view3d.height);
         orthographicLens.far = 8000;
         _camera3d.position = new Vector3D(0,0,-1000);
         _camera3d.lookAt(new Vector3D(0,0,0));
         var _loc6_:ObjectContainer3D = new ObjectContainer3D();
         var _loc5_:Mesh = new Mesh(null,null,true);
         _loc5_.geometry = new PlaneGeometry(1000,1000,1,1,true);
         _loc6_.addChild(_loc5_);
         _loc6_.scaleZ = 2;
         _loc6_.position = new Vector3D(0,0,300);
         bgBoxCamear = new ObjectContainer3D();
         this.tween_camera_update();
         bgBox = new ObjectContainer3D();
         bgBoxCamear.addChild(bgBox);
         bgBlur1 = new Image3D("test/glur1.png",1550,950,0);
         bgFake2D = new Image3D("test/bg2dfake.png",1550,950,0);
         bg2D = new Image3D("test/bg2dreal.png",1550,950,0);
         bgFake3D = new Image3D("test/floor2.png",1550,950,0);
         bg3D = new Image3D("test/b3.png",1550,950,0);
         bgBlur2 = new Image3D("test/glur2.png",1550,950,0);
         floor = new Image3D("test/floor/e2009_08.png",512,512,0);
         floor.x = this.bossInitX;
         floor.alpha = 0;
         floor.rotationX = 90;
         floor.scaleAll = 4;
         _scene3d.addChild(rootLayer);
         rootLayer.addChild(unitLayer);
         rootLayer.addChild(effLayer);
         lightEffectCtrl = new LightEffectCtrl(effLayer);
         bgBox.z = 3000;
         bgBox.addChild(bg2D);
         bgBox.addChild(bgBlur1);
         bgBox.addChild(bgBlur2);
         bgBox.addChild(bgFake2D);
         bgBox.addChild(bgFake3D);
         bgBox.addChild(bg3D);
         bgBlur1.alpha = 0.99;
         bgBlur2.alpha = 0.99;
         bgFake2D.alpha = 0.99;
         bgFake3D.alpha = 0.99;
         bgBlur1.x = 1550;
         bgBlur2.x = 1550;
         bgFake2D.x = 1550;
         bgFake3D.x = 1550;
         bg3D.x = 1550;
         bgBlur1.z = -4;
         bgFake2D.z = -3;
         bgFake3D.z = -2;
         bgBlur2.z = -1;
         bgBlur2.alpha = 0.5;
         rootLayer.addChild(bgBoxCamear);
         uvAnimateCtrl = new UVAnimateCtrl(bgBlur1);
         uvAnimateCtrlB = new UVAnimateCtrl(bgBlur2);
         autoRotationFloor = new AutoRotationCtrl(this.floor);
         this.addEventListener("enterFrame",onFrame);
         vBox0 = new VBox();
         vBox0.right = 0;
         vBox0.space = 10;
         vBox0.y = 300;
         slider = new HSlider("png.comp.hscroll");
         vBox0.addChild(slider);
         slider.width = 300;
         slider.min = -360;
         slider.max = 360;
         slider.tick = 1;
         slider.value = 0;
         slider.changeHandler = slider_changeHandler;
         _loc2_ = new Object3DParams("镜头");
         _loc2_.bind(_camera3d);
         _loc2_.scale = 0.8;
         vBox0.addChild(_loc2_);
         o3dArr.push(_loc2_);
         _loc2_ = new Object3DParams("背景");
         _loc2_.scale = 0.8;
         _loc2_.bind(this.floor);
         vBox0.addChild(_loc2_);
         this.addChild(vBox0);
         o3dArr.push(_loc2_);
         var _loc8_:Tab = new Tab("png.comp.tab");
         _loc8_.labels = "0,1广角镜头,2正交镜头,3人物3D站位,4播放,5恢复,6,7,8UV动画,9,10,11显示/隐藏UI,12光";
         this.addChild(_loc8_);
         _loc8_.right = 0;
         _loc8_.skin = "png.comp.tab";
         _loc8_.selectHandler = tab_selectHandler;
         var _loc4_:HBox = new HBox();
         btnZoomIn = new Button("png.comp.button","镜头拉近");
         btnLookAt = new Button("png.comp.button","看向Boss");
         btnZoomOut = new Button("png.comp.button","镜头拉远");
         btnZoomIn.clickHandler = btn_onClick;
         btnLookAt.clickHandler = btn_onClick;
         btnZoomOut.clickHandler = btn_onClick;
         _loc4_.addChild(btnZoomIn);
         _loc4_.addChild(btnLookAt);
         _loc4_.addChild(btnZoomOut);
         _loc4_.y = 30;
         _loc4_.right = 0;
         this.addChild(_loc4_);
         sliderOffsetU = new HSlider("png.comp.hscroll");
         sliderOffsetU.width = 300;
         sliderOffsetU.min = 0;
         sliderOffsetU.max = 1;
         sliderOffsetU.tick = 0.05;
         sliderOffsetU.value = bg2D.subMeshes[0].offsetU;
         sliderOffsetU.changeHandler = sliderOffsetU_onChange;
         sliderOffsetV = new HSlider("png.comp.hscroll");
         sliderOffsetV.width = 300;
         sliderOffsetV.min = 0;
         sliderOffsetV.max = 1;
         sliderOffsetV.tick = 0.05;
         sliderOffsetV.value = bg2D.subMeshes[0].offsetV;
         sliderOffsetV.changeHandler = sliderOffsetV_onChange;
         sliderScaleU = new HSlider("png.comp.hscroll");
         sliderScaleU.width = 300;
         sliderScaleU.min = 0;
         sliderScaleU.max = 1;
         sliderScaleU.tick = 0.05;
         sliderScaleU.value = bg2D.subMeshes[0].scaleU;
         sliderScaleU.changeHandler = sliderScaleU_onChange;
         sliderScaleV = new HSlider("png.comp.hscroll");
         sliderScaleV.width = 300;
         sliderScaleV.min = 0;
         sliderScaleV.max = 1;
         sliderScaleV.tick = 0.05;
         sliderScaleV.value = bg2D.subMeshes[0].scaleV;
         sliderScaleV.changeHandler = sliderScaleV_onChange;
         var _loc3_:VBox = new VBox();
         _loc3_.right = 0;
         _loc3_.y = 55;
         _loc3_.addChild(this.sliderOffsetU);
         _loc3_.addChild(this.sliderOffsetV);
         _loc3_.addChild(this.sliderScaleU);
         _loc3_.addChild(this.sliderScaleV);
         initUnitViewArr();
         boss.avatarBody.addChild(floor);
         new GetResEffect3DTask(UrlLib.e3d_particle(StcMgr.ins.getSpecialEffectVo(1226).effect));
      }
      
      private function btn_onClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btnZoomIn !== _loc2_)
         {
            if(btnLookAt !== _loc2_)
            {
               if(btnZoomOut === _loc2_)
               {
                  _camera3d.position = TransformUtil.nextPoi3D(_camera3d.position,_camera3d.eulers,-100);
                  refreshUI();
               }
            }
            else
            {
               _camera3d.lookAt(boss.avatarBody.position);
               refreshUI();
            }
         }
         else
         {
            _camera3d.position = TransformUtil.nextPoi3D(_camera3d.position,_camera3d.eulers,100);
            refreshUI();
         }
      }
      
      public function showBg(param1:String) : void
      {
         bgUrl = param1;
         AppGlobalContext.QueueLoader.loadOne(new ResourceVo(param1),load_res_onCompl);
      }
      
      private function load_res_onCompl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         var _loc1_:BitmapTexture = AssetLib.getBitmapTexture(bgUrl);
         _view3d.background = _loc1_;
      }
      
      private function initLight() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         lightCtrl = new LightAndShadowCtrl2(this.rootLayer);
         var _loc2_:int = unitViewHash.array.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = unitViewHash.array[_loc3_];
            _loc1_.lightPicker = lightCtrl.lightPicker;
            _loc3_++;
         }
      }
      
      private function tab_selectHandler(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = undefined;
         _loc3_ = 1200;
         var _loc10_:* = param1;
         if(0 !== _loc10_)
         {
            if(12 !== _loc10_)
            {
               if(1 !== _loc10_)
               {
                  if(2 !== _loc10_)
                  {
                     if(3 !== _loc10_)
                     {
                        if(6 !== _loc10_)
                        {
                           if(7 !== _loc10_)
                           {
                              if(4 !== _loc10_)
                              {
                                 if(4000 !== _loc10_)
                                 {
                                    if(4012 !== _loc10_)
                                    {
                                       if(4002 !== _loc10_)
                                       {
                                          if(4021 !== _loc10_)
                                          {
                                             if(7 !== _loc10_)
                                             {
                                                if(4024 !== _loc10_)
                                                {
                                                   if(10 !== _loc10_)
                                                   {
                                                      if(4030 !== _loc10_)
                                                      {
                                                         if(4031 !== _loc10_)
                                                         {
                                                            if(40 !== _loc10_)
                                                            {
                                                               if(6 !== _loc10_)
                                                               {
                                                                  if(5 !== _loc10_)
                                                                  {
                                                                     if(11 !== _loc10_)
                                                                     {
                                                                        if(12 !== _loc10_)
                                                                        {
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        vBox0.visible = !vBox0.visible;
                                                                        vBoxUnitArr.visible = !vBoxUnitArr.visible;
                                                                        hBoxUnitArr1.visible = !hBoxUnitArr1.visible;
                                                                        hBoxUnitArr2.visible = !hBoxUnitArr2.visible;
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     if(old != null)
                                                                     {
                                                                        TweenLite.killTweensOf(bg2D);
                                                                        TweenLite.killTweensOf(bgBlur1);
                                                                        bg2D.x = 0;
                                                                        bg2D.visible = true;
                                                                        bg2D.scaleAll = 1;
                                                                        bgBlur1.x = 1550;
                                                                        bgBlur1.x = -387.5;
                                                                        bgBlur2.x = 387.5;
                                                                        bg3D.x = 1550;
                                                                        bg3D.scaleAll = 1;
                                                                        tab_selectHandler(2);
                                                                        TweenLite.killTweensOf(_camera3d);
                                                                        TweenLite.to(_camera3d,2,{
                                                                           "x":old.x,
                                                                           "overwrite":0,
                                                                           "ease":_loc4_,
                                                                           "onComplete":tween_onComplete
                                                                        });
                                                                        TweenLite.to(_camera3d,2,{
                                                                           "y":old.y,
                                                                           "overwrite":0,
                                                                           "ease":_loc4_
                                                                        });
                                                                        TweenLite.to(_camera3d,2,{
                                                                           "z":old.z,
                                                                           "overwrite":0,
                                                                           "ease":_loc4_
                                                                        });
                                                                        TweenLite.to(_camera3d,2,{
                                                                           "rotationX":old.rotationX,
                                                                           "overwrite":0,
                                                                           "ease":_loc4_
                                                                        });
                                                                        TweenLite.to(_camera3d,2,{
                                                                           "rotationY":old.rotationY,
                                                                           "overwrite":0,
                                                                           "ease":_loc4_
                                                                        });
                                                                        _loc7_ = unitViewHash.array.length;
                                                                        _loc9_ = 0;
                                                                        while(_loc9_ < _loc7_)
                                                                        {
                                                                           _loc2_ = unitViewHash.array[_loc9_];
                                                                           TweenLite.killTweensOf(_loc2_.avatarBody);
                                                                           TweenLite.to(_loc2_.avatarBody,2,{
                                                                              "x":old["user" + _loc9_].x,
                                                                              "overwrite":0,
                                                                              "ease":_loc4_
                                                                           });
                                                                           TweenLite.to(_loc2_.avatarBody,2,{
                                                                              "y":old["user" + _loc9_].y,
                                                                              "overwrite":0,
                                                                              "ease":_loc4_
                                                                           });
                                                                           TweenLite.to(_loc2_.avatarBody,2,{
                                                                              "z":old["user" + _loc9_].z,
                                                                              "overwrite":0,
                                                                              "ease":_loc4_
                                                                           });
                                                                           TweenLite.to(_loc2_.avatarBody,2,{
                                                                              "scaleX":old["user" + _loc9_].scaleX,
                                                                              "overwrite":0,
                                                                              "ease":_loc4_
                                                                           });
                                                                           TweenLite.to(_loc2_.avatarBody,2,{
                                                                              "scaleY":old["user" + _loc9_].scaleY,
                                                                              "overwrite":0,
                                                                              "ease":_loc4_
                                                                           });
                                                                           TweenLite.to(_loc2_.avatarBody,2,{
                                                                              "scaleZ":old["user" + _loc9_].scaleZ,
                                                                              "overwrite":0,
                                                                              "ease":_loc4_
                                                                           });
                                                                           _loc9_++;
                                                                        }
                                                                        boss.runTo(new Vector3D(0,0,bossInitX),100);
                                                                     }
                                                                     _camera3d.lens = orthographicLens;
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  _loc6_ = new Vector3D(-664,411,-430);
                                                                  _loc8_ = new Vector3D(6,59,0);
                                                                  _loc3_ = 600;
                                                                  cameraToAim(_loc6_,_loc8_,_loc4_,_loc3_ / 1000,0);
                                                                  _loc3_ = 500;
                                                               }
                                                            }
                                                            else
                                                            {
                                                               _loc3_ = 1200;
                                                               old = {
                                                                  "x":_camera3d.x,
                                                                  "y":_camera3d.y,
                                                                  "z":_camera3d.z,
                                                                  "rotationX":_camera3d.rotationX,
                                                                  "rotationY":_camera3d.rotationY
                                                               };
                                                               boss.runTo(new Vector3D(0,0,1000),_loc3_);
                                                               TweenLite.delayedCall(_loc3_ / 4 / 1000,tab_selectHandler,[401]);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            if(eff)
                                                            {
                                                               eff.dispose();
                                                               eff = null;
                                                            }
                                                            lightEffectCtrl.stop();
                                                            _loc3_ = 1200;
                                                            this.bg3D.x = 0;
                                                            this.bg3D.alpha = 0;
                                                            TweenLite.to(this.bg3D,_loc3_ / 1000,{
                                                               "alpha":1,
                                                               "overwrite":0
                                                            });
                                                            TweenLite.to(this.bg3D,_loc3_ / 1000,{
                                                               "x":0,
                                                               "overwrite":0
                                                            });
                                                            TweenLite.to(this.bg3D,_loc3_ / 1000,{
                                                               "y":0,
                                                               "overwrite":0
                                                            });
                                                            TweenLite.to(this.bg3D,_loc3_ / 1000,{
                                                               "scaleAll":1,
                                                               "overwrite":0
                                                            });
                                                            TweenLite.to(this.bgBlur1,_loc3_ / 1000,{"alpha":0});
                                                            TweenLite.to(this.floor,_loc3_ / 1000,{"alpha":0});
                                                         }
                                                      }
                                                      else
                                                      {
                                                         bossActioning = false;
                                                         this.unitAlpha = 1;
                                                         _loc3_ = 800;
                                                         _loc6_ = new Vector3D(-676,129,-449);
                                                         _loc8_ = new Vector3D(-10,63,0);
                                                         cameraToAim(_loc6_,_loc8_,null,_loc3_ / 1000,0);
                                                         TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4031]);
                                                      }
                                                   }
                                                }
                                                _loc3_ = 1700;
                                                _loc6_ = new Vector3D(208,407,-413);
                                                _loc8_ = new Vector3D(-10,59,0);
                                                cameraToAim(_loc6_,_loc8_,null,_loc3_ / 1000,0);
                                                TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4030]);
                                             }
                                          }
                                          lightEffectCtrl.center = new Point(boss.avatarBody.x,boss.avatarBody.z);
                                          lightEffectCtrl.range = new Point(500,500);
                                          lightEffectCtrl.use3D = true;
                                          lightEffectCtrl.start();
                                          this.unitAlpha = 0;
                                          this.bg2D.alpha = 0;
                                          _loc3_ = 1000;
                                          _loc6_ = new Vector3D(177,500,-306);
                                          _loc8_ = new Vector3D(0,80,0);
                                          cameraToAim(_loc6_,_loc8_,null,_loc3_ / 1000,0);
                                          TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4024]);
                                       }
                                       else
                                       {
                                          _loc3_ = 1200;
                                          lightEffectCtrl.stop();
                                          TweenLite.delayedCall(_loc3_ / 3 / 1000,tab_selectHandler,[1]);
                                          this.tweenObject(boss.avatarBody,_loc3_ / 1000,new Vector3D(bossInitX,0,0),null,NaN,this.bossScaleP);
                                          unitToBossView();
                                          skillIndex = 0;
                                          bossActioning = true;
                                          boss.action = "skill2";
                                          eff = EffectManager.createEffect(UrlLib.e3d_particle(StcMgr.ins.getSpecialEffectVo(1226).effect),true,boss.avatarBody);
                                          eff.scale(0.6);
                                          eff.y = -60;
                                          _loc6_ = new Vector3D(-892,500,1022);
                                          _loc8_ = new Vector3D(0,100,0);
                                          cameraToAim(_loc6_,_loc8_,null,_loc3_ / 1000,0);
                                          TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4021]);
                                       }
                                    }
                                    else
                                    {
                                       _loc5_ = 4100;
                                       ShakeUtil.shake(false,this.rootLayer,0,_loc5_ / 40,14,40);
                                       _loc3_ = 100;
                                       this.unitAlpha = 0;
                                       TweenLite.to(bg2D,_loc3_ / 1000,{"alpha":0});
                                       bgBlur1.x = 0;
                                       bgBlur1.alpha = 0;
                                       TweenLite.to(bgBlur1,_loc3_ / 1000 + 1,{"alpha":1});
                                       this.uvAnimateCtrl.start();
                                       lightEffectCtrl.center = new Point(boss.avatarBody.x,boss.avatarBody.z);
                                       lightEffectCtrl.range = new Point(500,500);
                                       lightEffectCtrl.use3D = true;
                                       autoRotationFloor.start();
                                       floor.alpha = 1;
                                       TweenLite.to(boss.avatarBody,_loc3_ / 1000,{
                                          "rotationY":90,
                                          "overwrite":0
                                       });
                                       _loc6_ = new Vector3D(-2500,0,1500);
                                       _loc8_ = new Vector3D(0,90,0);
                                       cameraToAim(_loc6_,_loc8_,null,_loc3_ / 1000,0);
                                       TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4002]);
                                    }
                                 }
                                 else
                                 {
                                    _loc3_ = 2000;
                                    _loc7_ = unitViewHash.array.length;
                                    _loc9_ = 0;
                                    while(_loc9_ < _loc7_)
                                    {
                                       _loc2_ = unitViewHash.array[_loc9_];
                                       this.tweenObject(_loc2_.avatarBody,_loc3_ / 1000,new Vector3D(_loc2_.avatarBody.x - 700,_loc2_.avatarBody.y,_loc2_.avatarBody.z),null,0);
                                       _loc9_++;
                                    }
                                    TweenLite.to(bg2D,_loc3_ / 3 / 1000,{"alpha":0.3});
                                    this.tweenObject(boss.avatarBody,0,new Vector3D(0,-2000,1500),new Vector3D(0,0,0),0,24);
                                    TweenLite.to(boss.avatarBody,_loc3_ / 1000,{"alpha":1});
                                    TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4012]);
                                 }
                              }
                              else
                              {
                                 _loc5_ = 2100;
                                 ShakeUtil.shake(false,this.rootLayer,0,_loc5_ / 20,8,20);
                                 lightEffectCtrl = new LightEffectCtrl(effLayer);
                                 lightEffectCtrl.center = new Point(0,-200);
                                 lightEffectCtrl.range.y = 150;
                                 lightEffectCtrl.start();
                                 _loc3_ = 600;
                                 TweenLite.delayedCall(_loc3_ / 1000,this.tab_selectHandler,[4000]);
                              }
                           }
                           else
                           {
                              _camera3d.position = TransformUtil.nextPoi3D(_camera3d.position,new Vector3D(0,56,0),-100);
                              refreshUI();
                           }
                        }
                        else
                        {
                           _camera3d.position = TransformUtil.nextPoi3D(_camera3d.position,new Vector3D(0,56,0),100);
                           refreshUI();
                        }
                     }
                     else
                     {
                        tab_selectHandler(1);
                        unitToBossView();
                        this.cameraToBossView();
                        refreshUI();
                     }
                  }
                  else
                  {
                     _camera3d.lens = orthographicLens;
                     _camera3d.lens.far = 8000;
                     _camera3d.lens.near = 100;
                     _camera3d.position = _camera3d.position;
                     _loc10_ = 1;
                     bgBox.scaleZ = _loc10_;
                     _loc10_ = _loc10_;
                     bgBox.scaleY = _loc10_;
                     bgBox.scaleX = _loc10_;
                     refreshUI();
                  }
               }
               else
               {
                  _camera3d.lens = perspectiveLens;
                  _camera3d.lens.far = 8000;
                  _camera3d.lens.near = 100;
                  _camera3d.position = _camera3d.position;
                  _loc10_ = 3.85;
                  bgBox.scaleZ = _loc10_;
                  _loc10_ = _loc10_;
                  bgBox.scaleY = _loc10_;
                  bgBox.scaleX = _loc10_;
                  refreshUI();
               }
            }
            else
            {
               initLight();
            }
         }
         else
         {
            refreshUI();
         }
      }
      
      private function onACTION_CPL(param1:Event) : void
      {
         if(bossActioning)
         {
            switch(int(skillIndex))
            {
               case 0:
                  boss.action = "skill1";
                  skillIndex = 1;
                  break;
               case 1:
                  boss.action = "skill2";
                  skillIndex = 0;
            }
         }
         else
         {
            boss.action = "std1";
         }
      }
      
      private function cameraToAim(param1:Vector3D, param2:Vector3D, param3:*, param4:Number, param5:int) : void
      {
         TweenLite.to(_camera3d,param4,{
            "x":param1.x,
            "overwrite":0,
            "ease":param3,
            "onComplete":tween_onComplete,
            "onCompleteParams":[param5]
         });
         TweenLite.to(_camera3d,param4,{
            "y":param1.y,
            "overwrite":0,
            "ease":param3
         });
         TweenLite.to(_camera3d,param4,{
            "z":param1.z,
            "overwrite":0,
            "ease":param3
         });
         TweenLite.to(_camera3d,param4,{
            "rotationX":param2.x,
            "overwrite":0,
            "ease":param3
         });
         TweenLite.to(_camera3d,param4,{
            "rotationY":param2.y,
            "overwrite":0,
            "ease":param3
         });
      }
      
      private function tweenObject(param1:*, param2:Number = 0, param3:Vector3D = null, param4:Vector3D = null, param5:Number = NaN, param6:Number = NaN) : void
      {
         if(param3 != null)
         {
            tweenObjectParam(param1,param2,"x",param3.x);
            tweenObjectParam(param1,param2,"y",param3.y);
            tweenObjectParam(param1,param2,"z",param3.z);
         }
         if(param4)
         {
            tweenObjectParam(param1,param2,"rotationX",param4.x);
            tweenObjectParam(param1,param2,"rotationY",param4.y);
            tweenObjectParam(param1,param2,"rotationZ",param4.z);
         }
         if(isNaN(param5) == false)
         {
            tweenObjectParam(param1,param2,"alpha",param5);
         }
         if(isNaN(param6) == false)
         {
            tweenObjectParam(param1,param2,"scaleAll",param6);
         }
      }
      
      private function tweenObjectParam(param1:*, param2:Number, param3:String, param4:Number) : void
      {
         var _loc5_:* = null;
         if(param2 > 0)
         {
            _loc5_ = {};
            _loc5_[param3] = param4;
            _loc5_["overwrite"] = 0;
            TweenLite.to(param1,param2,_loc5_);
         }
         else
         {
            param1[param3] = param4;
         }
      }
      
      private function tween_camera_update() : void
      {
         bgBoxCamear.position = _camera3d.position;
         bgBoxCamear.rotationX = _camera3d.rotationX;
         bgBoxCamear.rotationY = _camera3d.rotationY;
         bgBoxCamear.rotationZ = _camera3d.rotationZ;
      }
      
      private function cameraToBossView() : void
      {
         _camera3d.position = new Vector3D(-664,411,-430);
         _camera3d.rotateTo(6,59,0);
      }
      
      private function unitToBossView(param1:* = null) : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = 0;
         var _loc5_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:int = unitViewHash.array.length;
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = unitViewHash.array[_loc7_];
            _loc4_ = _loc7_;
            _loc5_ = Math.floor(_loc4_ / 3);
            _loc3_ = _loc4_ % 3;
            old["user" + _loc7_] = {};
            old["user" + _loc7_] = {
               "x":_loc2_.avatarBody.x,
               "y":_loc2_.avatarBody.y,
               "z":_loc2_.avatarBody.z,
               "scaleX":_loc2_.avatarBody.scaleX,
               "scaleY":_loc2_.avatarBody.scaleY,
               "scaleZ":_loc2_.avatarBody.scaleZ
            };
            TweenLite.to(_loc2_.avatarBody,2,{
               "x":_loc5_ * -100 - 200,
               "overwrite":0,
               "ease":param1
            });
            TweenLite.to(_loc2_.avatarBody,2,{
               "y":0,
               "overwrite":0,
               "ease":param1
            });
            TweenLite.to(_loc2_.avatarBody,2,{
               "z":_loc3_ * -200 + 200,
               "overwrite":0,
               "ease":param1
            });
            TweenLite.to(_loc2_.avatarBody,2,{
               "scaleX":1.6,
               "overwrite":0,
               "ease":param1
            });
            TweenLite.to(_loc2_.avatarBody,2,{
               "scaleY":1.6,
               "overwrite":0,
               "ease":param1
            });
            TweenLite.to(_loc2_.avatarBody,2,{
               "scaleZ":1.6,
               "overwrite":0,
               "ease":param1
            });
            _loc7_++;
         }
      }
      
      private function tween_onComplete(param1:int = 0) : void
      {
         refreshUI();
         if(param1 > 0)
         {
         }
      }
      
      private function refreshUI() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = o3dArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = o3dArr[_loc3_];
            _loc1_.refresh();
            _loc3_++;
         }
      }
      
      private function slider_changeHandler(param1:Number) : void
      {
      }
      
      private function sliderOffsetU_onChange(param1:Number) : void
      {
         bg2D.subMeshes[0].offsetU = param1;
      }
      
      private function sliderOffsetV_onChange(param1:Number) : void
      {
         bg2D.subMeshes[0].offsetV = param1;
      }
      
      private function sliderScaleU_onChange(param1:Number) : void
      {
         bg2D.subMeshes[0].scaleU = param1;
      }
      
      private function sliderScaleV_onChange(param1:Number) : void
      {
         bg2D.subMeshes[0].scaleV = param1;
      }
      
      private function onFrame(param1:Event) : void
      {
         tween_camera_update();
         _view3d.render();
      }
      
      private function initUnitViewArr() : void
      {
         var _loc12_:int = 0;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc9_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:* = null;
         vBoxUnitArr = new VBox();
         vBoxUnitArr.scale = 0.8;
         var _loc11_:HBox = new HBox();
         hBoxUnitArr1 = _loc11_;
         var _loc8_:HBox = new HBox();
         hBoxUnitArr2 = _loc8_;
         _loc11_.space = 2;
         _loc8_.space = 2;
         vBoxUnitArr.bottom = 0;
         vBoxUnitArr.space = 2;
         unitViewHash = new DictHash();
         var _loc10_:int = unitVoArr.length;
         var _loc5_:int = 0;
         _loc12_ = 0;
         while(_loc12_ < _loc10_)
         {
            _loc7_ = unitVoArr[_loc12_];
            if(_loc7_.isAttack)
            {
               _loc2_ = new nslm2.modules.fightPlayer.UnitView(_loc7_,this);
               unitViewHash.put(_loc7_.id,_loc2_);
               unitLayer.addChild(_loc2_.avatarBody);
               _loc9_ = Math.floor(_loc5_ / 3);
               _loc3_ = _loc5_ % 3;
               _loc4_ = _loc3_ * -150 + 150 - 200;
               _loc2_.avatarBody.position = new Vector3D(_loc9_ * -200 - 200 - 50 * _loc3_,_loc4_,_loc4_);
               _loc2_.avatarBody.scale(1.6);
               _loc2_.avatarBody.rotationY = -90;
               _loc2_.action = "std1";
               _loc1_ = new Object3DParams(_loc2_.vo.name);
               _loc1_.bind(_loc2_.avatarBody);
               _loc1_.scale = 0.8;
               if(_loc9_ == 0)
               {
                  _loc11_.addChild(_loc1_);
               }
               else
               {
                  _loc8_.addChild(_loc1_);
               }
               o3dArr.push(_loc1_);
               _loc5_++;
            }
            _loc12_++;
         }
         this.addChild(_loc8_);
         _loc8_.top = 20;
         this.addChild(_loc11_);
         _loc11_.bottom = 0;
         var _loc6_:UnitVo = new UnitVo();
         _loc6_.npc_id = 100190;
         boss = new nslm2.modules.fightPlayer.UnitView(_loc6_,this);
         rootLayer.addChild(boss.avatarBody);
         boss.action = "std1";
         boss.avatarBody.x = bossInitX;
         boss.avatarBody.y = 0;
         boss.avatarBody.rotationY = 90;
         boss.avatarBody.scaleAll = bossScaleP;
         boss.addEventListener("actionCpl",this.onACTION_CPL);
         _loc1_ = new Object3DParams("BOSS");
         _loc1_.bind(boss.avatarBody);
         _loc1_.scale = 0.8;
         vBox0.addChild(_loc1_);
         o3dArr.push(_loc1_);
      }
      
      public function set unitAlpha(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         _alpha = param1;
         var _loc3_:int = unitViewHash.array.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitViewHash.array[_loc4_];
            _loc2_.avatarBody.alpha = param1;
            _loc4_++;
         }
      }
      
      public function get unitAlpha() : Number
      {
         return _alpha;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["fightStart","fightFinishImmediately"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc5_:* = param1;
         if("fightStart" !== _loc5_)
         {
            if("fightFinishImmediately" !== _loc5_)
            {
            }
         }
         else
         {
            _loc5_ = 0;
            var _loc4_:* = unitVoArr;
            for each(var _loc3_ in unitVoArr)
            {
               _loc3_.hp = _loc3_.hp_max;
            }
         }
      }
   }
}
