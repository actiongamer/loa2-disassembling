package morn.customs.components
{
   import morn.core.components.Component;
   import com.mz.core.interFace.IUniqueId;
   import morn.core.utils.StringUtils;
   import flash.display.BitmapData;
   import morn.core.components.AutoBitmap;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Styles;
   import com.greensock.TweenLite;
   import morn.core.utils.UniqueId;
   
   public class ClipList extends Component implements IUniqueId
   {
       
      
      protected var _align:String = "left";
      
      protected var _clipX:int = 1;
      
      protected var _clipY:int = 1;
      
      protected var _clipWidth:Number;
      
      protected var _clipHeight:Number;
      
      protected var _url:String;
      
      protected var _gapX:int = 0;
      
      protected var _clips:Vector.<BitmapData>;
      
      protected var _strValue:String;
      
      public var clipArr:Vector.<AutoBitmap>;
      
      public var _uniqueId:uint;
      
      protected var _sizeGrid:Array;
      
      private var _value:Number = 0;
      
      private var _tweenValue:Number;
      
      private var _smoothing:Boolean;
      
      private var _clearFromLoader:Boolean = false;
      
      public function ClipList(param1:String = null)
      {
         super();
         clipArr = new Vector.<AutoBitmap>();
         this.url = param1;
         this._uniqueId = UniqueId.next;
      }
      
      public static function changeNumber2LocalFormat(param1:Number) : String
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         return param1.toString();
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function get align() : String
      {
         return _align;
      }
      
      public function set align(param1:String) : void
      {
         if(_align != param1)
         {
            _align = param1;
            callLater(changeClip);
         }
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
         return _clips;
      }
      
      public function set clips(param1:Vector.<BitmapData>) : void
      {
         if(param1)
         {
            _clips = param1;
            render();
         }
         sendEvent("imageLoaded");
      }
      
      protected function render() : void
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         _strValue = changeNumber2LocalFormat(this._value);
         var _loc1_:int = _strValue.length;
         var _loc4_:int = this.clipArr.length;
         _loc5_ = 0;
         while(_loc5_ < Math.min(_loc1_,_loc4_))
         {
            _loc2_ = this.clipArr[_loc5_];
            renderBitmap(_loc2_,_loc5_,_loc1_);
            if(_strValue.substr(_loc5_,1) == " ")
            {
               _loc2_.index = -1;
            }
            else
            {
               _loc2_.index = int(_strValue.substr(_loc5_,1));
            }
            _loc5_++;
         }
         while(_loc5_ < _loc1_)
         {
            _loc2_ = new AutoBitmap();
            this.addChild(_loc2_);
            renderBitmap(_loc2_,_loc5_,_loc1_);
            if(String(_strValue).substr(_loc5_,1) == " ")
            {
               _loc2_.index = -1;
            }
            else
            {
               _loc2_.index = int(String(_strValue).substr(_loc5_,1));
            }
            this.clipArr.push(_loc2_);
            _loc5_++;
         }
         var _loc3_:* = _loc5_;
         _loc5_ = _loc4_ - 1;
         while(_loc5_ >= _loc3_)
         {
            _loc2_ = this.clipArr[_loc5_];
            if(_loc2_)
            {
               DisplayUtils.removeSelf(_loc2_);
               _loc2_.bitmapData = null;
            }
            this.clipArr.splice(_loc5_,1);
            _loc5_--;
         }
      }
      
      protected function renderBitmap(param1:AutoBitmap, param2:int, param3:int) : void
      {
         param1.clips = this.clips;
         param1.smoothing = this.smoothing;
         param1.anchorX = this.anchorX;
         param1.anchorY = this.anchorY;
         param1.sizeGrid = this._sizeGrid;
         var _loc4_:* = this.align;
         if("left" !== _loc4_)
         {
            if("center" !== _loc4_)
            {
               if("right" === _loc4_)
               {
                  param1.x = (param2 - param3) * (clipWidth + _gapX) + _gapX;
               }
            }
            else
            {
               param1.x = (param2 - param3 / 2) * (clipWidth + _gapX) + _gapX / 2;
            }
         }
         else
         {
            param1.x = param2 * (clipWidth + _gapX);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeClip);
         exeCallLater(render);
         super.commitMeasure();
      }
      
      public function get sizeGrid() : String
      {
         if(_sizeGrid)
         {
            return _sizeGrid.join(",");
         }
         return null;
      }
      
      public function set sizeGrid(param1:String) : void
      {
         _sizeGrid = StringUtils.fillArray(Styles.defaultSizeGrid,param1);
      }
      
      public function get totalFrame() : int
      {
         exeCallLater(changeClip);
         return !!_clips?_clips.length:0;
      }
      
      public function get value() : Number
      {
         return _value;
      }
      
      public function set value(param1:Number) : void
      {
         _value = Math.round(Math.abs(param1));
         if(this._clips)
         {
            callLater(render);
         }
         else
         {
            callLater(changeClip);
         }
      }
      
      public function get tweenValue() : Number
      {
         return _tweenValue;
      }
      
      public function set tweenValue(param1:Number) : void
      {
         _tweenValue = param1;
         if(this._clips)
         {
            TweenLite.to(this,0.3,{
               "value":_tweenValue,
               "overwrite":2
            });
         }
         else
         {
            _value = param1;
            callLater(changeClip);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is int || param1 is String)
         {
            this.value = int(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get smoothing() : Boolean
      {
         return _smoothing;
      }
      
      public function set smoothing(param1:Boolean) : void
      {
         _smoothing = param1;
      }
      
      public function set clearFromLoader(param1:Boolean) : void
      {
         _clearFromLoader = param1;
      }
      
      public function get clearFormLoader() : Boolean
      {
         return _clearFromLoader;
      }
      
      override public function dispose() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = clipArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = clipArr[_loc3_];
            _loc1_.bitmapData = null;
            DisplayUtils.removeSelf(_loc1_);
            _loc3_++;
         }
         if(_url)
         {
            App.asset.removeCited(_url,this);
         }
         super.dispose();
      }
      
      public function get gapX() : int
      {
         return _gapX;
      }
      
      public function set gapX(param1:int) : void
      {
         if(_gapX != param1)
         {
            _gapX = param1;
            callLater(changeClip);
         }
      }
   }
}
