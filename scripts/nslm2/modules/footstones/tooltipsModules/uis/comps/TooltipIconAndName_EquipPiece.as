package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_normalUI;
   import morn.core.components.Image;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipIconAndName_EquipPiece extends TooltipIconAndName_normalUI
   {
       
      
      public function TooltipIconAndName_EquipPiece(param1:String, param2:int, param3:String, param4:String, param5:int)
      {
         var _loc6_:* = null;
         super();
         this.img_quality.skin = "png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_" + param2;
         _loc6_ = new Image("png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_mask");
         _loc6_.x = img_icon.x;
         _loc6_.y = img_icon.y;
         _loc6_.width = img_icon.width;
         _loc6_.height = img_icon.height;
         _loc6_.cacheAsBitmap = true;
         DisplayUtils.addChildAbove(_loc6_,img_icon);
         _loc6_.mouseEvent = false;
         this.img_icon.skin = param1;
         this.img_icon.cacheAsBitmap = true;
         this.img_icon.mask = _loc6_;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         if(param5 > 0 && param5 != 1)
         {
            this.txt2.color = param5 <= PlayerModel.ins.level?458496:16723968;
            this.txt2.text = LocaleMgr.ins.getStr(10000003) + ": " + PlayerModel.ins.level + "/" + param5;
         }
         else
         {
            this.txt2.text = "";
         }
         this.x = 15;
      }
   }
}
