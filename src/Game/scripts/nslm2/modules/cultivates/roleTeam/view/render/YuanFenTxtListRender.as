package nslm2.modules.cultivates.roleTeam.view.render
{
   import game.ui.roleTeam.render.YuanFenTxtRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcMengyueVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class YuanFenTxtListRender extends YuanFenTxtRenderUI
   {
       
      
      private var _data:StcMengyueVo;
      
      public function YuanFenTxtListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         _data = param1 as StcMengyueVo;
         if(_data)
         {
            _loc2_ = StcMgr.ins.getNpcVo(_data.node);
            txt_name.text = LocaleMgr.ins.getStr(_loc2_.name) + " " + LocaleMgr.ins.getStr(999000091) + "+1";
            this.toolTip = "【" + LocaleMgr.ins.getStr(_data.name) + "】" + LocaleMgr.ins.getStr(_data.desc);
         }
      }
   }
}
