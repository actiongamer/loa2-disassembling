package morn.core.components
{
   import flash.events.Event;
   import morn.core.handlers.Handler;
   import morn.customs.expands.SkinConfigVo;
   
   public class RadioButton extends Button
   {
       
      
      protected var _value:Object;
      
      public var preCondHandler;
      
      private var _selectedSkin:SkinConfigVo;
      
      protected var _selectedBmd:morn.core.components.AutoBitmap;
      
      public function RadioButton(param1:String = null, param2:String = "")
      {
         super(param1,param2);
      }
      
      override protected function preinitialize() : void
      {
         super.preinitialize();
         _toggle = false;
         _autoSize = false;
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         _btnLabel.autoSize = "left";
         addEventListener("click",onClick);
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
      
      protected function onClick(param1:Event) : void
      {
         if(preCondHandler)
         {
            if(Handler.executeAndReturn(preCondHandler))
            {
               selected = true;
            }
         }
         else
         {
            selected = true;
         }
      }
      
      public function get value() : Object
      {
         return _value != null?_value:label;
      }
      
      public function set value(param1:Object) : void
      {
         _value = param1;
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
