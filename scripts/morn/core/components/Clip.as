package morn.core.components
{
   import morn.editor.core.IClip;
   import com.mz.core.interFace.IUniqueId;
   import morn.core.handlers.Handler;
   import flash.events.Event;
   import flash.display.BitmapData;
   import morn.core.utils.StringUtils;
   import morn.core.utils.UniqueId;
   
   public class Clip extends Component implements IClip, IUniqueId
   {
       
      
      protected var _autoStopAtRemoved:Boolean = true;
      
      protected var _bitmap:morn.core.components.AutoBitmap;
      
      protected var _clipX:int = 1;
      
      protected var _clipY:int = 1;
      
      protected var _clipWidth:Number;
      
      protected var _clipHeight:Number;
      
      protected var _url:String;
      
      protected var _autoPlay:Boolean;
      
      protected var _interval:int;
      
      protected var _from:int = -1;
      
      protected var _to:int = -1;
      
      protected var _complete:Handler;
      
      protected var _isPlaying:Boolean;
      
      public var _uniqueId:uint;
      
      private var _clearFromLoader:Boolean = false;
      
      public function Clip(param1:String = null, param2:int = 1, param3:int = 1)
      {
         _interval = Config.MOVIE_INTERVAL;
         super();
         _clipX = param2;
         _clipY = param3;
         this.url = param1;
         this._uniqueId = UniqueId.next;
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      override protected function createChildren() : void
      {
         _bitmap = new morn.core.components.AutoBitmap();
         addChild(new morn.core.components.AutoBitmap());
      }
      
      override protected function initialize() : void
      {
         addEventListener("addedToStage",onAddedToStage);
         addEventListener("removedFromStage",onRemovedFromStage);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         if(_autoPlay)
         {
            play();
         }
      }
      
      protected function onRemovedFromStage(param1:Event) : void
      {
         if(_autoStopAtRemoved)
         {
            stop();
         }
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set url(param1:String) : void
      {
         if(_url != param1 && param1)
         {
            _url = param1;
            callLater(changeClip);
         }
      }
      
      public function get skin() : String
      {
         return _url;
      }
      
      public function set skin(param1:String) : void
      {
         url = param1;
      }
      
      public function get clipX() : int
      {
         return _clipX;
      }
      
      public function set clipX(param1:int) : void
      {
         if(_clipX != param1)
         {
            _clipX = param1;
            callLater(changeClip);
         }
      }
      
      public function get clipY() : int
      {
         return _clipY;
      }
      
      public function set clipY(param1:int) : void
      {
         if(_clipY != param1)
         {
            _clipY = param1;
            callLater(changeClip);
         }
      }
      
      public function get clipWidth() : Number
      {
         return _clipWidth;
      }
      
      public function set clipWidth(param1:Number) : void
      {
         _clipWidth = param1;
         callLater(changeClip);
      }
      
      public function get clipHeight() : Number
      {
         return _clipHeight;
      }
      
      public function set clipHeight(param1:Number) : void
      {
         _clipHeight = param1;
         callLater(changeClip);
      }
      
      protected function changeClip() : void
      {
         if(App.asset.hasBitmapData(_url))
         {
            loadComplete(_url,false,App.asset.getBitmapData(_url,false));
         }
         else
         {
            App.mloader.loadBMD(_url,1,new Handler(loadComplete,[_url,true]));
         }
      }
      
      protected function loadComplete(param1:String, param2:Boolean, param3:BitmapData) : void
      {
         if(param1 == _url && param3)
         {
            if(!isNaN(_clipWidth))
            {
               _clipX = Math.ceil(param3.width / _clipWidth);
            }
            if(!isNaN(_clipHeight))
            {
               _clipY = Math.ceil(param3.height / _clipHeight);
            }
            clips = App.asset.getClips(param1,_clipX,_clipY,true,!!param2?param3.clone():param3);
            App.asset.addCited(_url,this);
         }
      }
      
      public function get clips() : Vector.<BitmapData>
      {
         return _bitmap.clips;
      }
      
      public function set clips(param1:Vector.<BitmapData>) : void
      {
         if(param1)
         {
            _bitmap.clips = param1;
            _contentWidth = _bitmap.width;
            _contentHeight = _bitmap.height;
         }
         sendEvent("imageLoaded");
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         _bitmap.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         _bitmap.height = param1;
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeClip);
         super.commitMeasure();
      }
      
      public function get sizeGrid() : String
      {
         if(_bitmap.sizeGrid)
         {
            return _bitmap.sizeGrid.join(",");
         }
         return null;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _bitmap.sizeGrid = StringUtils.fillArray(Styles.defaultSizeGrid,param1);
      }
      
      public function get repeatSkin() : Boolean
      {
         return _bitmap.repeatSkin;
      }
      
      public function set repeatSkin(param1:Boolean) : void
      {
         _bitmap.repeatSkin = param1;
      }
      
      public function get frame() : int
      {
         return _bitmap.index;
      }
      
      public function set frame(param1:int) : void
      {
         var _loc2_:* = null;
         _bitmap.index = param1;
         sendEvent("frameChanged");
         if(_bitmap.index == _to)
         {
            stop();
            _to = -1;
            if(_complete != null)
            {
               _loc2_ = _complete;
               _complete = null;
               _loc2_.execute();
            }
         }
      }
      
      public function get index() : int
      {
         return _bitmap.index;
      }
      
      public function set index(param1:int) : void
      {
         frame = param1;
      }
      
      public function get totalFrame() : int
      {
         exeCallLater(changeClip);
         return !!_bitmap.clips?_bitmap.clips.length:0;
      }
      
      public function get autoStopAtRemoved() : Boolean
      {
         return _autoStopAtRemoved;
      }
      
      public function set autoStopAtRemoved(param1:Boolean) : void
      {
         _autoStopAtRemoved = param1;
      }
      
      public function get autoPlay() : Boolean
      {
         return _autoPlay;
      }
      
      public function set autoPlay(param1:Boolean) : void
      {
         if(_autoPlay != param1)
         {
            _autoPlay = param1;
            !!_autoPlay?play():stop();
         }
      }
      
      public function get interval() : int
      {
         return _interval;
      }
      
      public function set interval(param1:int) : void
      {
         if(_interval != param1)
         {
            _interval = param1;
            if(_isPlaying)
            {
               play();
            }
         }
      }
      
      public function get isPlaying() : Boolean
      {
         return _isPlaying;
      }
      
      public function set isPlaying(param1:Boolean) : void
      {
         _isPlaying = param1;
      }
      
      public function play() : void
      {
         _isPlaying = true;
         frame = _bitmap.index;
         App.timer.doLoop(_interval,loop);
      }
      
      protected function loop() : void
      {
         frame = Number(frame) + 1;
      }
      
      public function stop() : void
      {
         App.timer.clearTimer(loop);
         _isPlaying = false;
      }
      
      public function gotoAndPlay(param1:int) : void
      {
         this.frame = param1;
         play();
      }
      
      public function gotoAndStop(param1:int) : void
      {
         stop();
         this.frame = param1;
      }
      
      public function playFromTo(param1:int = -1, param2:int = -1, param3:Handler = null) : void
      {
         _from = param1 == -1?0:param1;
         _to = param2 == -1?_clipX * _clipY - 1:param2;
         _complete = param3;
         gotoAndPlay(_from);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is int || param1 is String)
         {
            frame = int(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get smoothing() : Boolean
      {
         return _bitmap.smoothing;
      }
      
      public function set smoothing(param1:Boolean) : void
      {
         _bitmap.smoothing = param1;
      }
      
      override public function get anchorX() : Number
      {
         return _bitmap.anchorX;
      }
      
      override public function set anchorX(param1:Number) : void
      {
         _bitmap.anchorX = param1;
      }
      
      override public function get anchorY() : Number
      {
         return _bitmap.anchorY;
      }
      
      override public function set anchorY(param1:Number) : void
      {
         _bitmap.anchorY = param1;
      }
      
      public function get bitmap() : morn.core.components.AutoBitmap
      {
         return _bitmap;
      }
      
      public function set clearFromLoader(param1:Boolean) : void
      {
         _clearFromLoader = param1;
      }
      
      public function get clearFormLoader() : Boolean
      {
         return _clearFromLoader;
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeClip);
         super.cancelMeasure();
      }
      
      override public function dispose() : void
      {
         _bitmap.bitmapData = null;
         if(_url)
         {
            App.asset.removeCited(_url,this);
         }
         super.dispose();
      }
   }
}
