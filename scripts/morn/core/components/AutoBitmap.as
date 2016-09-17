package morn.core.components
{
   import flash.display.Bitmap;
   import morn.customs.expands.ICommitMeasure;
   import com.mz.core.interFace.IDispose;
   import com.mz.core.interFace.IUniqueId;
   import flash.display.BitmapData;
   import com.mz.core.mgrs.resMgrs.CiteBitmapData;
   import morn.core.utils.BitmapUtils;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.utils.UniqueId;
   
   public final class AutoBitmap extends Bitmap implements ICommitMeasure, IDispose, IUniqueId
   {
       
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _sizeGrid:Array;
      
      private var _repeatSkin:Boolean;
      
      private var _source:Vector.<BitmapData>;
      
      private var _clips:Vector.<BitmapData>;
      
      private var _index:int;
      
      private var _smoothing:Boolean;
      
      private var _anchorX:Number;
      
      private var _anchorY:Number;
      
      public var _uniqueId:uint;
      
      public var isDisposed:Boolean;
      
      public function AutoBitmap()
      {
         _smoothing = Styles.smoothing;
         super();
         this._uniqueId = UniqueId.next;
      }
      
      public function commitMeasure() : void
      {
         App.render.exeCallLater(changeSize);
      }
      
      public function get uniqueId() : uint
      {
         return _uniqueId;
      }
      
      override public function get width() : Number
      {
         return !!isNaN(_width)?!!super.bitmapData?super.bitmapData.width:super.width:_width;
      }
      
      override public function set width(param1:Number) : void
      {
         if(_width != param1)
         {
            _width = param1;
            App.render.callLater(changeSize);
         }
      }
      
      override public function get height() : Number
      {
         return !!isNaN(_height)?!!super.bitmapData?super.bitmapData.height:super.height:_height;
      }
      
      override public function set height(param1:Number) : void
      {
         if(_height != param1)
         {
            _height = param1;
            App.render.callLater(changeSize);
         }
      }
      
      public function get sizeGrid() : Array
      {
         return _sizeGrid;
      }
      
      public function set sizeGrid(param1:Array) : void
      {
         _sizeGrid = param1;
         App.render.callLater(changeSize);
      }
      
      public function get repeatSkin() : Boolean
      {
         return _repeatSkin;
      }
      
      public function set repeatSkin(param1:Boolean) : void
      {
         _repeatSkin = param1;
         App.render.callLater(changeSize);
      }
      
      override public function set bitmapData(param1:BitmapData) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(clips)
         {
            _loc4_ = clips.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = clips[_loc5_] as CiteBitmapData;
               if(_loc3_)
               {
                  _loc3_.removeCited(this);
               }
               _loc5_++;
            }
         }
         if(param1)
         {
            if(param1 is CiteBitmapData)
            {
               (param1 as CiteBitmapData).addCited(this);
            }
            clips = new <BitmapData>[param1];
         }
         else
         {
            if(_source != null)
            {
               _loc4_ = _source.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  _loc2_ = _source[_loc5_];
                  if(_loc2_ is CiteBitmapData)
                  {
                     (_loc2_ as CiteBitmapData).removeCited(this);
                  }
                  _loc5_++;
               }
            }
            disposeTempBitmapdata();
            _clips = null;
            _source = null;
            .super.bitmapData = null;
         }
      }
      
      public function get clips() : Vector.<BitmapData>
      {
         return _source;
      }
      
      public function set clips(param1:Vector.<BitmapData>) : void
      {
         disposeTempBitmapdata();
         _source = param1;
         if(param1 && param1.length > 0)
         {
            .super.bitmapData = param1[0];
            App.render.callLater(changeSize);
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function set index(param1:int) : void
      {
         _index = param1;
         if(_index == -1)
         {
            .super.bitmapData = null;
            return;
         }
         if(_clips && _clips.length > 0)
         {
            _index = _index < _clips.length && _index > -1?_index:0;
            .super.bitmapData = _clips[_index];
            .super.smoothing = _smoothing;
         }
      }
      
      private function changeSize() : void
      {
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:* = undefined;
         var _loc5_:int = 0;
         var _loc2_:int = 0;
         if(_source && _source.length > 0)
         {
            _loc1_ = Math.round(width);
            _loc4_ = Math.round(height);
            disposeTempBitmapdata();
            try
            {
               _loc3_ = new Vector.<BitmapData>();
               _loc5_ = 0;
               _loc2_ = _source.length;
               while(_loc5_ < _loc2_)
               {
                  if(_repeatSkin)
                  {
                     _loc3_.push(BitmapUtils.repeadBmd(_source[_loc5_],_loc1_,_loc4_));
                  }
                  else if(_sizeGrid)
                  {
                     _loc3_.push(BitmapUtils.scale9Bmd(_source[_loc5_],_sizeGrid,_loc1_,_loc4_));
                  }
                  else
                  {
                     if(_loc1_ != _source[_loc5_].width || _loc4_ != _source[_loc5_].height)
                     {
                        this.smoothing = true;
                     }
                     _loc3_.push(_source[_loc5_]);
                  }
                  _loc5_++;
               }
               _clips = _loc3_;
               index = _index;
            }
            catch($err:Error)
            {
               Log.error(this,$err,$err.getStackTrace());
            }
            .super.width = _loc1_;
            .super.height = _loc4_;
         }
         if(!isNaN(_anchorX))
         {
            .super.x = -Math.round(_anchorX * width);
         }
         if(!isNaN(_anchorY))
         {
            .super.y = -Math.round(_anchorY * height);
         }
      }
      
      private function disposeTempBitmapdata() : void
      {
         var _loc1_:int = 0;
         if(_clips)
         {
            _loc1_ = _clips.length - 1;
            while(_loc1_ > -1)
            {
               if(_source == null || _clips.length != _source.length || _clips[_loc1_] != _source[_loc1_])
               {
                  _clips[_loc1_].dispose();
               }
               _loc1_--;
            }
            _clips.length = 0;
         }
      }
      
      override public function get smoothing() : Boolean
      {
         return _smoothing;
      }
      
      override public function set smoothing(param1:Boolean) : void
      {
         _smoothing = param1;
         .super.smoothing = param1;
      }
      
      public function get anchorX() : Number
      {
         return _anchorX;
      }
      
      public function set anchorX(param1:Number) : void
      {
         _anchorX = param1;
      }
      
      public function get anchorY() : Number
      {
         return _anchorY;
      }
      
      public function set anchorY(param1:Number) : void
      {
         _anchorY = param1;
      }
      
      public function cancelMeasure() : void
      {
         App.render.cancelCallLater(this.changeSize);
      }
      
      public function dispose() : void
      {
         DisplayUtils.removeSelf(this);
         cancelMeasure();
         isDisposed = true;
         bitmapData = null;
      }
   }
}
