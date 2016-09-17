package away3d.textures
{
   import flash.utils.getTimer;
   import flash.events.Event;
   import flash.display.Sprite;
   import flash.display.BitmapData;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   
   public class BmcTexture extends BitmapTexture
   {
       
      
      private var _autoUpdate:Boolean;
      
      public var url:String;
      
      private var isLoaded:Boolean;
      
      public var totalFrames:int;
      
      public var msPerFrame:int;
      
      public var curFrame:int = 0;
      
      private var lastTimer:int;
      
      private var fireTimer:int;
      
      private var _broadcaster:Sprite;
      
      public function BmcTexture(param1:String, param2:int = 24, param3:int = 10)
      {
         super(new BitmapData(256,256,true,65280),false);
         this.url = "3d/" + param1;
         msPerFrame = 1000 / param2;
         totalFrames = param3;
         ResMgr.ins.load(3,url,loader_cpl);
      }
      
      private function loader_cpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         isLoaded = true;
      }
      
      public function update() : void
      {
         var _loc3_:int = 0;
         if(isLoaded == false)
         {
            return;
         }
         var _loc1_:int = getTimer();
         fireTimer = fireTimer + (_loc1_ - this.lastTimer);
         this.lastTimer = _loc1_;
         var _loc2_:int = Math.floor(fireTimer / msPerFrame);
         fireTimer = fireTimer % msPerFrame;
         if(_loc2_ > 0)
         {
            _loc3_ = curFrame;
            _loc3_ = (_loc3_ + _loc2_ - 1) % totalFrames + 1;
            curFrame = _loc3_;
            this.bitmapData = App.asset.getBitmapData("png.asset3d.sea.f" + (curFrame - 1));
            invalidateContent();
         }
      }
      
      private function autoUpdateHandler(param1:Event) : void
      {
         update();
      }
      
      public function get autoUpdate() : Boolean
      {
         return _autoUpdate;
      }
      
      public function set autoUpdate(param1:Boolean) : void
      {
         if(param1 == _autoUpdate)
         {
            return;
         }
         _autoUpdate = param1;
         if(param1)
         {
            this.lastTimer = getTimer();
            if(_broadcaster == null)
            {
               _broadcaster = new Sprite();
            }
            _broadcaster.addEventListener("enterFrame",autoUpdateHandler,false,0,true);
         }
         else if(_broadcaster)
         {
            _broadcaster.removeEventListener("enterFrame",autoUpdateHandler);
         }
      }
      
      override public function dispose() : void
      {
         if(isDisposed)
         {
            return;
         }
         isLoaded = false;
         super.dispose();
      }
   }
}
