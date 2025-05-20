#include <iostream>
#include <vector>
#include <cmath>

auto rotary_positional_encodings(int seq_len, int embed_dim) {
    std::vector<std::vector<double>> pe(seq_len, std::vector<double>(embed_dim));

    for (int pos = 0; pos < seq_len; ++pos) {
        for (int i = 0; i < embed_dim; i += 2) {
            double theta = pos / std::pow(10000.0, (2.0 * i) / embed_dim);
            pe[pos][i] = std::cos(theta);
            if (i + 1 < embed_dim)
                pe[pos][i + 1] = std::sin(theta);
        }
    }

    return pe;
}

int main() {
    int seq_len = 5;
    int embed_dim = 8;
    auto pe = rotary_positional_encodings(seq_len, embed_dim);

    for (const auto& row : pe) {
        for (double val : row)
            std::cout << val << " ";
        std::cout << "\n";
    }

    return 0;
}
