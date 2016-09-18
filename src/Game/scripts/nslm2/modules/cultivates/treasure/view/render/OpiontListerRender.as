package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.OptionListRenderUI;
   import nslm2.modules.cultivates.treasure.vo.RuneTypeVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   
   public class OpiontListerRender extends OptionListRenderUI
   {
       
      
      private var _data:RuneTypeVo;
      
      public function OpiontListerRender()
      {
         super();
         this.addEventListener("click",changeSelect);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as RuneTypeVo;
         var _loc2_:int = _data.type;
         txt_name.text = LocaleMgr.ins.getStr(30600100 + _loc2_);
         selectRender.selected = _data.selected;
      }
      
      private function changeSelect(param1:MouseEvent) : void
      {
         _data.selected = !_data.selected;
         selectRender.selected = _data.selected;
      }
   }
}
