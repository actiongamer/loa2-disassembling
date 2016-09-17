package nslm2.modules.battles.battlefields.panels
{
   import game.ui.battlefield.BattlefieldScene.panel.FlagInfoViewUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.battles.battlefields.vos.BattleFlagInfoData;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   
   public class BattleFieldFlagInfoView extends FlagInfoViewUI
   {
       
      
      private var cdCtr:TextCDCtrlS2;
      
      private var _data:BattleFlagInfoData;
      
      public function BattleFieldFlagInfoView()
      {
         super();
      }
      
      public function update(param1:BattleFlagInfoData) : void
      {
         _data = param1;
         txt_resName.text = param1.showName;
         if(_data.ownerId)
         {
            if(!cdCtr)
            {
               cdCtr = new TextCDCtrlS2(txt_resStatus,getStatusString,null);
            }
            cdCtr.start(_data.outTimeStamp);
         }
         else if(_data.refreshStamp && (_data.id == 2501 || _data.leftCnt > 0))
         {
            if(!cdCtr)
            {
               cdCtr = new TextCDCtrlS2(txt_resStatus,getStatusString,null);
            }
            cdCtr.start(_data.refreshStamp);
         }
         else
         {
            if(cdCtr)
            {
               cdCtr.stop();
            }
            txt_resStatus.text = LocaleMgr.ins.getStr(50500164,[_data.leftCnt,_data.maxCnt]);
            if(_data.id == 2501)
            {
               txt_resStatus.text = LocaleMgr.ins.getStr(50500169);
            }
         }
      }
      
      private function getStatusString(param1:int) : String
      {
         var _loc2_:* = null;
         if(_data.ownerId)
         {
            _loc2_ = LocaleMgr.ins.getStr(50500165) + TimeUtils.isColonWithZero(param1);
         }
         else
         {
            _loc2_ = LocaleMgr.ins.getStr(50500166) + TimeUtils.isColonWithZero(param1);
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         if(cdCtr)
         {
            cdCtr.dispose();
            cdCtr = null;
         }
         super.dispose();
      }
   }
}
