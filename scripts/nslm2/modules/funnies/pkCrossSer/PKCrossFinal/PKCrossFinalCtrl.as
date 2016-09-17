package nslm2.modules.funnies.pkCrossSer.PKCrossFinal
{
   import com.mz.core.interFace.IDispose;
   import game.ui.pkCrossSer.PKCrossModuleUI;
   import proto.CrossArenaInfoRes;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import nslm2.modules.funnies.pkCrossSer.PKCrossModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class PKCrossFinalCtrl implements IDispose
   {
       
      
      private var _skin:PKCrossModuleUI;
      
      private var _scene3D:nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalScene3D;
      
      private var _data:CrossArenaInfoRes;
      
      private var _rank:nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalRank;
      
      public function PKCrossFinalCtrl(param1:PKCrossModuleUI, param2:*)
      {
         var _loc3_:* = null;
         super();
         _data = param2;
         _skin = param1;
         _skin.top_panel.visible = false;
         _skin.rank_panel.visible = false;
         _skin.box_upbg.visible = false;
         _skin.chk_fastfight.visible = false;
         _scene3D = new nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalScene3D();
         _skin.addChild(_scene3D);
         _scene3D.init();
         _scene3D.initAvatars();
         _scene3D.changeEnemies(_data.finalEnemies);
         _skin.con_finalBox.visible = true;
         (_skin.btn_rewardIcon as TreasureBoxBaseRender).treasureType = 2;
         _skin.btn_rewardIcon.dataSource = new TreasureBoxVo([],1);
         if(!PKCrossModel.ins.isFinalFighter)
         {
            _loc3_ = LocaleMgr.ins.getStr(50600037);
         }
         else
         {
            _loc3_ = LocaleMgr.ins.getStr(11800102) + TextFieldUtil.htmlText2(_data.finalRank,65280);
         }
         _skin.txt_rewardCD.text = _loc3_;
         _rank = new nslm2.modules.funnies.pkCrossSer.PKCrossFinal.PKCrossFinalRank();
         _rank.top = 180;
         _rank.left = 0;
         this._skin.addChild(_rank);
      }
      
      public function updateEnemy(param1:Array) : void
      {
         _scene3D.changeEnemies(param1);
      }
      
      public function dispose() : void
      {
         if(_scene3D)
         {
            _scene3D.dispose();
         }
      }
   }
}
