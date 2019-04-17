package az.config;

import java.sql.SQLException;
import java.util.List;

public interface Repository<O> {

    public O find(O o);
    public List<O> findAll();
    public void save(O o) throws SQLException;
    public void update(O o);
    public void delete(O o);
}
