package nslm2.common.ui.components.comp3ds
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.scenes.commons.IMouseOutObject3D;
   import morn.customs.components.ModuleViewBase;
   import away3d.cameras.Camera3D;
   import away3d.controllers.HoverController;
   import away3d.containers.Scene3D;
   import away3d.containers.ObjectContainer3D;
   import away3d.containers.View3D;
   import morn.core.components.Image;
   import morn.customs.components.PanelBg;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import away3d.events.MouseEvent3D;
   import flash.events.Event;
   import com.mz.core.logging.Log;
   import nslm2.mgrs.MouseIconManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import away3d.filters.BloomFilter3D;
   import com.greensock.TweenLite;
   import org.specter3d.context.AppGlobalContext;
   import away3d.cameras.lenses.OrthographicLens;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import flash.display.DisplayObject;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl;
   import com.mz.core.utils.ArrayUtil;
   
   public class UIPanel3D extends Sprite implements IObserver, IMouseOutObject3D
   {
      
      public static var insArr:Vector.<nslm2.common.ui.components.comp3ds.UIPanel3D> = new Vector.<nslm2.common.ui.components.comp3ds.UIPanel3D>();
       
      
      private var _renderEnabled:Boolean = true;
      
      private var moduleView:ModuleViewBase;
      
      public var antiAlias:int = -1;
      
      private var _camera3d:Camera3D;
      
      private var _cameraController:HoverController;
      
      private var _debugAxesVisible:Boolean;
      
      private var _isRender:Boolean = true;
      
      private var _scene3d:Scene3D;
      
      public var layer3D:ObjectContainer3D;
      
      private var _view3d:View3D;
      
      private var _view3dHeight:Number = 10;
      
      private var _view3dWidth:Number = 10;
      
      public var border:int = 1;
      
      public var imgBg:Image;
      
      private var panelBg:PanelBg;
      
      public var bgImage3d:nslm2.common.ui.components.comp3ds.Image3D;
      
      private var tempBm2D:Bitmap;
      
      public var _useBloom:Boolean;
      
      public var bloomFilter:BloomFilter3D;
      
      public var lightCtrl:LightAndShadowCtrl;
      
      public function UIPanel3D(param1:ModuleViewBase)
      {
         layer3D = new ObjectContainer3D();
         super();
         moduleView = param1;
         insArr.push(this);
         ObserverMgr.ins.sendNotice("MSG_POP_UI_PANEL_3D_INIT",[this.moduleView.moduleId,this]);
         ObserverMgr.ins.regObserver(this);
      }
      
      public static function setVisibleAll(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = insArr;
         for each(var _loc2_ in insArr)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function initByImage(param1:Image, param2:PanelBg) : void
      {
         if(!panelBg)
         {
            ObserverMgr.ins.sendNotice("MSG_FAKE_SCENE",true);
         }
         this.panelBg = param2;
         this.imgBg = param1;
         this.init(param1.width + border * 2,param1.height + border * 2);
         var _loc3_:Point = DisplayUtils.localToTarget(param1,this.parent);
         this.x = _loc3_.x - border;
         this.y = _loc3_.y - border;
         bgImage3d = new nslm2.common.ui.components.comp3ds.Image3D(null,param1.width,param1.height,4000,true,false);
         bgImage3d.showByBmd(param1.bitmapData);
         this.addChild3D(bgImage3d);
         if(panelBg)
         {
            switchListeners(true);
         }
      }
      
      public function xy2Dto3D(param1:Point) : Point
      {
         return new Point(param1.x - this.width / 2,-(param1.y - this.height / 2));
      }
      
      public function xy3Dto2D(param1:Point) : Point
      {
         return new Point(param1.x + this.width / 2,-param1.y + this.height / 2);
      }
      
      public function switchListeners(param1:Boolean) : void
      {
         if(param1)
         {
            bgImage3d.mouseEnabled = true;
            bgImage3d.addEventListener("mouseOver3d",bgImage3d_mouseOver3D);
            bgImage3d.addEventListener("mouseOut3d",bgImage3d_mouseOut3D);
            bgImage3d.addEventListener("mouseDown3d",bgImage3d_mouse);
            this.panelBg.addEventListener("dragStart",dragStartHandler);
            this.panelBg.addEventListener("dragUpdate",dragUpdateHandler);
            this.panelBg.addEventListener("dragEnd",dragEndHandler);
         }
         else
         {
            bgImage3d.mouseEnabled = false;
            bgImage3d.removeEventListener("mouseOver3d",bgImage3d_mouseOver3D);
            bgImage3d.removeEventListener("mouseOut3d",bgImage3d_mouseOut3D);
            bgImage3d.removeEventListener("mouseDown3d",bgImage3d_mouse);
            this.panelBg.removeEventListener("dragStart",dragStartHandler);
            this.panelBg.removeEventListener("dragUpdate",dragUpdateHandler);
            this.panelBg.removeEventListener("dragEnd",dragEndHandler);
         }
      }
      
      protected function bgImage3d_mouseOver3D(param1:MouseEvent3D) : void
      {
         if(buttonMode)
         {
            setMouseCursorOver();
         }
      }
      
      protected function bgImage3d_mouseOut3D(param1:MouseEvent3D) : void
      {
         if(buttonMode)
         {
            setMouseCursorOut();
         }
      }
      
      private function bgImage3d_mouse(param1:Event) : void
      {
         Log.info(this,"bgImage3d_mouse");
      }
      
      protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(this);
         MouseIconManager.changeMouseCursor("hand");
      }
      
      protected function setMouseCursorOut() : void
      {
         MouseIconManager.reset();
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      public function doMouseOut() : void
      {
         bgImage3d_mouseOut3D(null);
      }
      
      private function dragStartHandler(param1:Event) : void
      {
         this.dragStart();
      }
      
      private function dragUpdateHandler(param1:Event) : void
      {
         this.dragUpdate();
      }
      
      private function dragEndHandler(param1:Event) : void
      {
         this.dragEnd();
      }
      
      public function dragStart(param1:Boolean = true) : void
      {
         if(tempBm2D)
         {
            return;
         }
         var _loc2_:BitmapData = new BitmapData(this.width,this.height,false,0);
         _view3d.renderer.queueSnapshot(_loc2_);
         _view3d.render();
         _loc2_.copyChannel(new BitmapData(_loc2_.width,_loc2_.height,true,0),new Rectangle(0,0,_loc2_.width,_loc2_.height),new Point(0,0),8,8);
         tempBm2D = new Bitmap(_loc2_);
         tempBm2D.x = this.x;
         tempBm2D.y = this.y;
         tempBm2D.width = this.width;
         tempBm2D.height = this.height;
         DisplayUtils.addChildBelow(tempBm2D,this);
         this.visible = false;
         if(param1)
         {
            ObserverMgr.ins.sendNotice("MSG_POP_MODULE_HOLE",null);
         }
      }
      
      public function get useBloom() : Boolean
      {
         return _useBloom;
      }
      
      public function set useBloom(param1:Boolean) : void
      {
         if(_useBloom != param1)
         {
            _useBloom = param1;
            if(param1)
            {
               if(this.bloomFilter == null)
               {
                  this.bloomFilter = new BloomFilter3D(10,10,0.95,2,3);
               }
               if(_view3d)
               {
                  _view3d.filters3d = [bloomFilter];
               }
            }
            else if(_view3d)
            {
               _view3d.filters3d = null;
            }
         }
      }
      
      public function dragUpdate() : void
      {
      }
      
      private function msgHoleAll() : void
      {
         var _loc1_:Point = this.localToGlobal(new Point());
         ObserverMgr.ins.sendNotice("MSG_POP_MODULE_HOLE",new Rectangle(_loc1_.x - border,_loc1_.y - border,this.width + border,this.height + border));
      }
      
      public function dragEnd() : void
      {
         if(tempBm2D)
         {
            this.tempBm2D.bitmapData.dispose();
            DisplayUtils.removeSelf(tempBm2D);
            tempBm2D = null;
            _view3d.render();
         }
         if(this.visible == false)
         {
            this.visible = true;
         }
      }
      
      public function changeBgImg(param1:BitmapData, param2:Number = 0.5, param3:Boolean = true) : void
      {
         var _loc4_:nslm2.common.ui.components.comp3ds.Image3D = bgImage3d;
         bgImage3d = new nslm2.common.ui.components.comp3ds.Image3D(null,_loc4_.initW,_loc4_.initH,4000,true);
         bgImage3d.showByBmd(param1);
         this.addChild3D(bgImage3d);
         if(param2 > 0)
         {
            TweenLite.from(bgImage3d,param2,{"alpha":0});
         }
         if(imgBg)
         {
            imgBg.autoSize = param3;
            imgBg.bitmapData = param1;
         }
         _loc4_.z = 4001;
         if(param2 > 0)
         {
            TweenLite.to(_loc4_,param2,{
               "alpha":0,
               "onComplete":removeOldBgImage3D,
               "onCompleteParams":[_loc4_]
            });
         }
         else
         {
            this.removeOldBgImage3D(_loc4_);
         }
      }
      
      private function removeOldBgImage3D(param1:nslm2.common.ui.components.comp3ds.Image3D) : void
      {
         param1.dispose();
      }
      
      public function init(param1:int = 512, param2:int = 512) : void
      {
         this.width = param1;
         this.height = param2;
         initView3D();
      }
      
      private function initView3D(... rest) : void
      {
         if(!_view3d)
         {
            _view3d = new View3D(null,null,null);
            _view3d.antiAlias = antiAlias < 0?AppGlobalContext.stage3d.view3d.antiAlias:antiAlias;
            _view3d.mouseChildren = false;
            _view3d.width = _view3dWidth;
            _view3d.height = _view3dHeight;
            addChild(_view3d);
            _view3d.stage3DProxy.width = 0;
            _view3d.stage3DProxy.height = 0;
            _view3d.forceMouseMove = false;
            if(useBloom)
            {
               _view3d.filters3d = [bloomFilter];
            }
            _scene3d = _view3d.scene;
            _scene3d.addChild(this.layer3D);
            _camera3d = _view3d.camera;
            _camera3d.lens.far = 5000;
            _camera3d.lens.near = 100;
            _camera3d.lens = new OrthographicLens(_view3d.height);
         }
         _isRender = true;
         if(_renderEnabled)
         {
            rendering();
         }
      }
      
      public function set aas(param1:int) : void
      {
         if(_view3d)
         {
            _view3d.antiAlias = param1;
         }
      }
      
      public function addChild3D(param1:ObjectContainer3D) : ObjectContainer3D
      {
         if(lightCtrl)
         {
            if(param1 is UIUnit3D)
            {
               (param1 as UIUnit3D).lightPicker = lightCtrl.lightPicker;
            }
            if(param1 is UIWeapon3D)
            {
               (param1 as UIWeapon3D).lightPicker = lightCtrl.lightPicker;
            }
         }
         return _scene3d.addChild(param1);
      }
      
      public function removeChild3D(param1:ObjectContainer3D) : void
      {
         if(lightCtrl && param1 is UIUnit3D)
         {
            (param1 as UIUnit3D).lightPicker = null;
         }
         _scene3d.removeChild(param1);
      }
      
      public function get cameraController() : HoverController
      {
         return _cameraController;
      }
      
      public function set cameraController(param1:HoverController) : void
      {
         _cameraController = param1;
      }
      
      override public function get height() : Number
      {
         return _view3dHeight;
      }
      
      override public function set height(param1:Number) : void
      {
         _view3dHeight = param1;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         _isRender = param1;
         _view3d && _loc2_;
         .super.visible = param1;
         checkVisible();
      }
      
      private function checkVisible() : void
      {
         if(imgBg)
         {
            if(this.visible)
            {
               if(panelBg)
               {
                  this.panelBg.bgHoleByComp(this.imgBg,this.border);
               }
               this.msgHoleAll();
               imgBg.visible = false;
               _view3d.render();
            }
         }
      }
      
      private function hideBg2D(param1:DisplayObject) : void
      {
         param1.visible = false;
      }
      
      override public function set x(param1:Number) : void
      {
         .super.x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         .super.y = param1;
      }
      
      override public function get width() : Number
      {
         return _view3dWidth;
      }
      
      override public function set width(param1:Number) : void
      {
         _view3dWidth = param1;
      }
      
      private function _onEnterFrame(param1:Event) : void
      {
         if(_isRender)
         {
            _view3d.render();
         }
      }
      
      public function setRenderEnabled(param1:Boolean) : void
      {
         _renderEnabled = param1;
         if(!_isRender)
         {
            return;
         }
         if(_renderEnabled)
         {
            if(hasEventListener("enterFrame") == false)
            {
               rendering();
            }
         }
         else if(hasEventListener("enterFrame") == true)
         {
            this.removeEventListener("enterFrame",_onEnterFrame);
         }
      }
      
      public function switchByPanel3D(param1:Boolean) : void
      {
         if(param1)
         {
            this._view3d.x = 0;
            this.msgHoleAll();
         }
         else
         {
            this._view3d.x = 1700;
         }
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:* = null;
         ObserverMgr.ins.unregObserver(this);
         if(bloomFilter)
         {
            bloomFilter.dispose();
            bloomFilter = null;
         }
         if(lightCtrl)
         {
            lightCtrl.dispose();
         }
         this.removeEventListener("enterFrame",_onEnterFrame);
         _isRender = false;
         if(imgBg)
         {
            imgBg.visible = true;
         }
         if(_view3d)
         {
            _view3d.parent && _view3d.parent.removeChild(_view3d);
            _view3d.dispose();
            _view3d = null;
         }
         if(this.panelBg)
         {
            switchListeners(false);
            ObserverMgr.ins.sendNotice("MSG_POP_MODULE_HOLE",null);
            this.panelBg = null;
         }
         ObserverMgr.ins.sendNotice("MSG_FAKE_SCENE",false);
         if(_scene3d)
         {
            _loc2_ = this._scene3d.numChildren;
            _loc3_ = _loc2_ - 1;
            while(_loc3_ >= 0)
            {
               _loc1_ = _scene3d.getChildAt(_loc3_) as ObjectContainer3D;
               _loc1_.dispose();
               _loc3_--;
            }
            _scene3d = null;
         }
         _camera3d = null;
         cameraController = null;
         DisplayUtils.removeSelf(this);
         ArrayUtil.removeItem(insArr,this);
         if(insArr.length > 0)
         {
            insArr[insArr.length - 1].switchByPanel3D(true);
         }
         ObserverMgr.ins.sendNotice("MSG_POP_UI_PANEL_3D_DISPOSE",this.moduleView.moduleId);
      }
      
      private function rendering() : void
      {
         this.addEventListener("enterFrame",_onEnterFrame,false,1000);
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_POP_UI_PANEL_3D_INIT"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_POP_UI_PANEL_3D_INIT" === _loc3_)
         {
            if(param2[1] != this)
            {
               this.switchByPanel3D(false);
            }
         }
      }
   }
}
