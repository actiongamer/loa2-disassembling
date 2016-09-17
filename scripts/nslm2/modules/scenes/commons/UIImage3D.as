package nslm2.modules.scenes.commons
{
   import org.specter3d.display.Specter3D;
   import com.mz.core.interFace.IDispose;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.materials.methods.ColorTransformMethod;
   import morn.core.handlers.Handler;
   import morn.core.components.Image;
   import flash.events.Event;
   import nslm2.modules.battles.battle.FPUtil;
   import flash.geom.ColorTransform;
   import org.specter3d.configs.Specter3DConfig;
   
   public class UIImage3D extends Specter3D implements IDispose
   {
       
      
      private var _image3D:Image3D;
      
      private var _colorTransformMethod:ColorTransformMethod;
      
      private var _disablecolorTransformMethod:ColorTransformMethod;
      
      private var _overHandler:Handler;
      
      private var _outHandler:Handler;
      
      private var _clickHandler:Handler;
      
      private var _loadCpl:Boolean;
      
      public function UIImage3D(param1:Specter3DConfig = null)
      {
         super(param1);
      }
      
      public function initByUrl(param1:String, param2:* = 0, param3:* = 0, param4:int = 4000, param5:Boolean = true, param6:Boolean = false, param7:Boolean = true) : void
      {
         this._image3D = new Image3D(param1,param2,param3,param4,param5,param6,param7);
         this._image3D.addEventListener("Image3DloadCpl",onLoadCpl);
         this._image3D.mouseChildren = true;
         this._image3D.mouseEnabled = true;
         this.addChild(_image3D);
         switchEventListener(true);
      }
      
      public function initByImg(param1:Image, param2:int = 3800) : void
      {
         _image3D = new Image3D(null,param1.width,param1.height,param2,true,false);
         _image3D.mouseEnabled = true;
         _image3D.mouseEnabled = true;
         _image3D.showByBmd(param1.bitmapData);
         this.addChild(_image3D);
         switchEventListener(true);
      }
      
      private function onLoadCpl(param1:Event) : void
      {
         this._loadCpl = true;
      }
      
      public function switchEventListener(param1:Boolean) : void
      {
         if(param1)
         {
            this._image3D.addEventListener("click3d",unitClick);
            this._image3D.addEventListener("mouseOver3d",unitOver);
            this._image3D.addEventListener("mouseOut3d",unitOut);
         }
         else
         {
            this._image3D.removeEventListener("click3d",unitClick);
            this._image3D.removeEventListener("mouseOver3d",unitOver);
            this._image3D.removeEventListener("mouseOut3d",unitOut);
         }
      }
      
      public function set disable(param1:Boolean) : void
      {
         if(param1)
         {
            if(_image3D)
            {
               this._image3D.addMethod(FPUtil.getGrayMethod());
            }
         }
      }
      
      private function unitClick(param1:Event) : void
      {
         if(_clickHandler)
         {
            _clickHandler.execute();
         }
      }
      
      private function unitOver(param1:Event) : void
      {
         if(_colorTransformMethod == null)
         {
            this._colorTransformMethod = new ColorTransformMethod();
            this._colorTransformMethod.colorTransform = new ColorTransform(1.2,1.2,1.2,1,0,0,0,0);
         }
         if(_image3D)
         {
            this._image3D.addMethod(_colorTransformMethod);
         }
         if(_overHandler)
         {
            this._overHandler.execute();
         }
      }
      
      private function unitOut(param1:Event) : void
      {
         if(_image3D)
         {
            _image3D.removeMethod(_colorTransformMethod);
         }
         if(_outHandler)
         {
            this._outHandler.execute();
         }
      }
      
      public function set clickHandler(param1:Handler) : void
      {
         this._clickHandler = param1;
      }
      
      public function set overHandler(param1:Handler) : void
      {
         this._overHandler = param1;
      }
      
      public function set outHandler(param1:Handler) : void
      {
         this._outHandler = param1;
      }
   }
}
