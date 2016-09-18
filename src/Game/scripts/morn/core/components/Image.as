package morn.core.components
{
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import flash.display.BitmapData;
   import morn.core.utils.StringUtils;
   
   public class Image extends Component
   {
      
      public static const BLOCK:String = "png.a5.comps.img_block";
      
      public static const BLOCK2:String = "png.comp.image";
       
      
      public var loadPriority:int = 3;
      
      public var autoSize:Boolean = false;
      
      protected var _bitmap:morn.core.components.AutoBitmap;
      
      protected var _url:String;
      
      private var _clearFromLoader:Boolean = false;
      
      public function Image(param1:String = null)
      {
         super();
         this.url = param1;
      }
      
      override protected function createChildren() : void
      {
         _bitmap = new morn.core.components.AutoBitmap();
         addChild(new morn.core.components.AutoBitmap());
      }
      
      public function get url() : String
      {
         return _url;
      }
      
      public function set url(param1:String) : void
      {
         if(_url != param1)
         {
            _url = param1;
            if(_url == "png.a5.comps.img_block" || _url == "png.comp.image")
            {
               bitmapData = null;
            }
            else if(param1)
            {
               if(App.asset.hasBitmapData(_url))
               {
                  bitmapData = App.asset.getBitmapData(_url);
               }
               else
               {
                  bitmapData = null;
                  ResMgr.ins.load(1,_url,loadUrlCpl,loadPriority);
               }
            }
            else
            {
               _bitmap.bitmapData = null;
            }
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
      
      public function get bitmapData() : BitmapData
      {
         return _bitmap.bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         if(param1)
         {
            if(autoSize)
            {
               this.width = param1.width;
               this.height = param1.height;
            }
            _contentWidth = param1.width;
            _contentHeight = param1.height;
         }
         _bitmap.bitmapData = param1;
         sendEvent("imageLoaded");
      }
      
      protected function loadUrlCpl(param1:String, param2:BitmapData) : void
      {
         if(param1 == _url)
         {
            ResMgr.ins.tranToCited(param1);
            bitmapData = param2;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         .super.width = param1;
         _bitmap.width = width;
      }
      
      override public function set height(param1:Number) : void
      {
         .super.height = param1;
         _bitmap.height = height;
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
      
      public function get bitmap() : morn.core.components.AutoBitmap
      {
         return _bitmap;
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
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is String)
         {
            url = String(param1);
         }
         else
         {
            .super.dataSource = param1;
         }
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
         _bitmap.bitmapData = null;
         super.dispose();
      }
   }
}
