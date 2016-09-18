package nslm2.modules.foundations.sevenDays.view
{
   import game.ui.sevenDayModule.view.DayGiftRenderUI;
   import nslm2.modules.foundations.sevenDays.vo.SevenDaysVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   
   public class DayGiftRender extends DayGiftRenderUI
   {
       
      
      private var _data:SevenDaysVo;
      
      public function DayGiftRender()
      {
         super();
         this.addEventListener("click",changeSelect);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         _data = param1 as SevenDaysVo;
         if(_data)
         {
            gift_hint.text = LocaleMgr.ins.getStr(_data.id);
            day_hint.text = _data.id.toString();
         }
      }
      
      private function changeSelect(param1:MouseEvent) : void
      {
      }
   }
}
