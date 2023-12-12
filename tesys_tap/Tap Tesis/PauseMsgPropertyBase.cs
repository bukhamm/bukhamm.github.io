public class PauseMsgPropertyBase
{
    internal int Order;

    public PauseMsgPropertyBase()
    {
    }

    public PauseMsgPropertyBase(byte[] data)
    {
        Data = data;
    }

    public override bool IsEndProperty => false;

    public short Position { get; internal set; }
    public byte[] Data { get; }
}