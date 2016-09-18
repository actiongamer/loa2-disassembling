package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipIconAndName_equipUI;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   
   public class TooltipIconAndName_equip extends TooltipIconAndName_equipUI
   {
       
      
      public function TooltipIconAndName_equip(param1:String, param2:int, param3:String, param4:String, param5:Number, param6:Boolean, param7:int = -1, param8:Boolean = true)
      {
         var _loc9_:* = null;
         super();
         if(ClientConfig.isRuLang())
         {
            this.txt_name.size = 12;
         }
         this.img_quality.skin = SkinLib.changeSkinNum_underline(this.img_quality.skin,param2);
         this.img_icon.skin = param1;
         this.txt_name.color = ColorLib.qualityColor(param2);
         this.txt_name.text = param3;
         this.txt_kind.text = param4;
         this.txt_equiped.visible = param6;
         (this.fightValueBox as FightValueBox).tweenValue = param5;
         this.fightValueBox.visible = param8;
         this.x = 15;
         if(FuncOpenAutoCtrl.checkOpen(30502))
         {
            this.list_stars.visible = true;
            _loc9_ = EquipGrowModel.getStarLightArray(param7,param2,"StarFromLeftToRight",true);
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
