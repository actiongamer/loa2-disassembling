package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_heroPieceUI;
   import morn.core.components.Image;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TooltipIconAndName_HeroPiece extends TooltipIconAndName_heroPieceUI
   {
       
      
      public function TooltipIconAndName_HeroPiece(param1:String, param2:int, param3:String, param4:String, param5:int, param6:int, param7:String, param8:String)
      {
         var _loc9_:* = null;
         super();
         this.img_quality.skin = "png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_" + param2;
         this.img_icon.skin = param1;
         _loc9_ = new Image("png.a5.bgs.iconBgs.equipPieces.img_EquipPiece_mask");
         _loc9_.x = img_icon.x;
         _loc9_.y = img_icon.y;
         _loc9_.width = img_icon.width;
         _loc9_.height = img_icon.height;
         _loc9_.cacheAsBitmap = true;
         DisplayUtils.addChildAbove(_loc9_,img_icon);
         _loc9_.mouseEvent = false;
         this.img_icon.skin = param1;
         this.img_icon.cacheAsBitmap = true;
         this.img_icon.mask = _loc9_;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         this.txt2.color = param5 >= param6?458496:16723968;
         this.txt2.text = LocaleMgr.ins.getStr(10000008) + ":  " + param5 + "/" + param6;
         this.img_group.skin = param7;
         this.txt_group.text = param8;
         this.x = 15;
      }
   }
}
