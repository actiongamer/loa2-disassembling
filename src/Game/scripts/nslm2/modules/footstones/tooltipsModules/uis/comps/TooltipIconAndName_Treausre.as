package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_treausreUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   
   public class TooltipIconAndName_Treausre extends TooltipIconAndName_treausreUI
   {
       
      
      public function TooltipIconAndName_Treausre(param1:String, param2:int, param3:String, param4:String, param5:Number, param6:Boolean, param7:int = -1, param8:Boolean = true)
      {
         var _loc9_:* = null;
         super();
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         this.txt_equiped.visible = param6;
         this.x = 15;
         if(FuncOpenAutoCtrl.checkOpen(30609) && param8)
         {
            this.list_stars.visible = true;
            _loc9_ = TreasureModel.getStarLightArray(param7,true);
            this.list_stars.repeatX = _loc9_.length;
            this.list_stars.dataSource = _loc9_;
         }
         else
         {
            this.list_stars.visible = false;
         }
      }
   }
}
