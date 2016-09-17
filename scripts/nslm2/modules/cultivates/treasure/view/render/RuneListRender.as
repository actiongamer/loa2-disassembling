package nslm2.modules.cultivates.treasure.view.render
{
   import game.ui.treasures.render.RuneRenderUI;
   import nslm2.modules.cultivates.treasure.vo.TreasureRuneHoleVo;
   import nslm2.common.vo.WealthVo;
   
   public class RuneListRender extends RuneRenderUI
   {
       
      
      private var _data:TreasureRuneHoleVo;
      
      public function RuneListRender()
      {
         super();
      }
      
      override public function get wealthVo() : WealthVo
      {
         if(_data)
         {
            return _data.runeVo;
         }
         return null;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as TreasureRuneHoleVo;
         if(_data)
         {
            switch(int(_data.status))
            {
               case 0:
                  img_lock.visible = true;
                  this.mouseChildren = false;
                  this.mouseEnabled = false;
                  break;
               case 1:
                  img_lock.visible = true;
                  this.mouseChildren = true;
                  this.mouseEnabled = true;
                  break;
               case 2:
                  img_lock.visible = false;
                  this.mouseChildren = true;
                  this.mouseEnabled = true;
            }
         }
         .super.dataSource = param1;
      }
   }
}
