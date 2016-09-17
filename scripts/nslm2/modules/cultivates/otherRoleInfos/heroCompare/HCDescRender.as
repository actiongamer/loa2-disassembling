package nslm2.modules.cultivates.otherRoleInfos.heroCompare
{
   import game.ui.heroCompare.render.HCDescRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HCDescRender extends HCDescRenderUI
   {
       
      
      public function HCDescRender()
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         super();
         (listBaseInfo.cells[0] as HCHeroSubInfoRender).txt_value.style = "渐变2";
         txt_title.text = LocaleMgr.ins.getStr(11700002);
         txt_base.text = LocaleMgr.ins.getStr(11700003);
         _loc2_ = 0;
         while(_loc2_ < listBaseInfo.cells.length)
         {
            _loc1_ = listBaseInfo.cells[_loc2_] as HCHeroSubInfoRender;
            _loc1_.dataSource = LocaleMgr.ins.getStr(11700004 + _loc2_);
            if(_loc2_ == 0)
            {
            }
            _loc2_++;
         }
         txt_tupo.text = LocaleMgr.ins.getStr(11700011);
         txt_jieshu.text = LocaleMgr.ins.getStr(11700012);
         txt_yuanfen.text = LocaleMgr.ins.getStr(11700013);
         txt_equip.text = LocaleMgr.ins.getStr(11700014);
         _loc2_ = 0;
         while(_loc2_ < listEquipInfo.cells.length)
         {
            _loc1_ = listEquipInfo.cells[_loc2_] as HCHeroSubInfoRender;
            _loc1_.dataSource = LocaleMgr.ins.getStr(11700015 + _loc2_);
            _loc2_++;
         }
         txt_baowu.text = LocaleMgr.ins.getStr(11700017);
         listBaowuInfo.cells[0].dataSource = LocaleMgr.ins.getStr(11700028);
         listBaowuInfo.cells[1].dataSource = LocaleMgr.ins.getStr(11700029);
         txt_militaryRank.text = LocaleMgr.ins.getStr(11700018);
         txt_horse.text = LocaleMgr.ins.getStr(11700019);
         txt_fashion.text = LocaleMgr.ins.getStr(11700020);
      }
      
      public function show(param1:Object) : void
      {
      }
   }
}
