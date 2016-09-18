package nslm2.modules.battles.battle
{
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class BuffVo
   {
       
      
      public var id:int;
      
      public var stacks:int;
      
      public var cd:int;
      
      public function BuffVo()
      {
         super();
      }
      
      public function get stcBuffVo() : StcBuffVo
      {
         return StcMgr.ins.getBuffVo(id);
      }
   }
}
