import numpy as np
import argparse
import shutil
import tqdm
from pathlib import Path

from hparams import hparams
from datasets.audio import _amp_to_db, _linear_to_mel, _normalize


def spec_to_mel(spec):
    S = (
        _amp_to_db(
            _linear_to_mel(spec ** hparams.magnitude_power, hparams),
            hparams,
        )
        - hparams.ref_level_db
    )

    if hparams.signal_normalization:
        return _normalize(S, hparams)

    return S


parser = argparse.ArgumentParser()
parser.add_argument("folder", type=Path)
args = parser.parse_args()

pbar = tqdm.tqdm(sorted(args.folder.glob("*.npy")), desc="Spec2mel ...")
for path in pbar:
    spec = np.load(path)
    mel = spec_to_mel(spec).transpose()
    shutil.copy(path, path.with_suffix(".old"))
    np.save(path, mel)
