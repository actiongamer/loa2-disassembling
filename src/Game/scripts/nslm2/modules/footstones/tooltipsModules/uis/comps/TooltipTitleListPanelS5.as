package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleListPanelS5UI;
   import game.ui.roleInfos.NpcPropVo;
   
   public class TooltipTitleListPanelS5 extends TooltipTitleListPanelS5UI
   {
       
      
      public function TooltipTitleListPanelS5(param1:String, param2:Array, param3:Class = null, param4:Boolean = false)
      {
         var _loc5_:int = 0;
         super();
         if(param3)
         {
            this.list_prop.itemRender = param3;
         }
         this.txt_title.text = param1;
         if(param4)
         {
            _loc5_ = param2.length - 1;
            while(_loc5_ >= 0)
            {
               if(param2[_loc5_] is NpcPropVo)
               {
                  if((param2[_loc5_] as NpcPropVo).value == 0)
                  {
                     param2.splice(_loc5_,1);
                  }
               }
               _loc5_--;
            }
         }
         this.list_prop.array = param2;
         this.x = 15;
         if(this.list_prop.repeatY > 3)
         {
            this.width = this.width + (this.list_prop.repeatY - 3) * 20;
         }
      }
   }
}
