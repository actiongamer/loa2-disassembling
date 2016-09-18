package morn.core.components
{
   import morn.customs.expands.SkinConfigVo;
   import morn.core.handlers.Handler;
   
   public class CheckBox extends Button
   {
       
      
      private var _selectedSkin:SkinConfigVo;
      
      protected var _selectedBmd:morn.core.components.AutoBitmap;
      
      public var preCondHandler;
      
      public function CheckBox(param1:String = null, param2:String = "")
      {
         super(param1,param2);
      }
      
      override protected function preinitialize() : void
      {
         super.preinitialize();
         _toggle = true;
         _autoSize = false;
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         _btnLabel.autoSize = "left";
      }
      
      override protected function changeLabelSize() : void
      {
         exeCallLater(changeClips);
         _btnLabel.x = _bitmap.width + _labelMargin[0];
         _btnLabel.y = (_bitmap.height - _btnLabel.height) * 0.5 + _labelMargin[1];
      }
      
      override public function commitMeasure() : void
      {
         exeCallLater(changeClips);
         super.commitMeasure();
      }
      
      override public function cancelMeasure() : void
      {
         cancelCallLater(changeClips);
         super.cancelMeasure();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _dataSource = param1;
         if(param1 is Boolean)
         {
            selected = param1;
         }
         else if(param1 is String)
         {
            selected = param1 == "true";
         }
         else
         {
            .super.dataSource = param1;
         }
      }
      
      public function get selectedSkin() : SkinConfigVo
      {
         return _selectedSkin;
      }
      
      public function set selectedSkin(param1:SkinConfigVo) : void
      {
         if(_selectedSkin != param1)
         {
            _selectedSkin = param1;
            if(this._selected)
            {
               createSelectedBmd();
            }
         }
      }
      
      private function createSelectedBmd() : void
      {
         if(_selectedSkin != null && _selectedBmd == null)
         {
            this._selectedBmd = new morn.core.components.AutoBitmap();
            this._selectedBmd.bitmapData = App.asset.getBitmapData(_selectedSkin.skin);
            this.addChild(_selectedBmd);
            this._selectedBmd.x = _selectedSkin.offsetX;
            this._selectedBmd.y = _selectedSkin.offsetY;
         }
      }
      
      override public function set selected(param1:Boolean) : void
      {
         if(preCondHandler)
         {
            if(Handler.executeAndReturn(preCondHandler,[param1]))
            {
               if(param1 == true)
               {
                  createSelectedBmd();
               }
               if(_selectedBmd)
               {
                  _selectedBmd.visible = param1;
               }
               .super.selected = param1;
            }
         }
         else
         {
            if(param1 == true)
            {
               createSelectedBmd();
            }
            if(_selectedBmd)
            {
               _selectedBmd.visible = param1;
            }
            .super.selected = param1;
         }
      }
   }
}
